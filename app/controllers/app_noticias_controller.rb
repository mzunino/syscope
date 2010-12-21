class AppNoticiasController < ApplicationController
  def index
    
    if session[:user_id]
      @user=User.find(session[:user_id])
      if @user
        @profile_id = @user.profile_id
      end 
    end
    @noticias = Contenido.find_noticias_activas_del_perfil(@profile_id)
    
    logger.debug("Entre al controler del index, user: #{@profile_id}")
    
    @modo_muestra_template = Contenido::MUESTRA_MODALIDAD_REDUCIDA
    
  end
  
  def show
    
    
    if session[:user_id]
      @user=User.find(session[:user_id])
      if @user
        @profile_id = @user.profile_id
      end 
    end
    @noticias = Contenido.find_noticias_activas_del_perfil(@profile_id)
    
    logger.debug("Entre al controler del index, user: #{@profile_id}")
    
    @modo_muestra_template = Contenido::MUESTRA_MODALIDAD_EDICION
    
    render "index"
    
  end
 
  def mostrar_noticia
    
    @modo_muestra_template = Contenido::MUESTRA_MODALIDAD_COMPLETA;
    
  	# muestra una noticia determinada
  	render(:layout => false)
	
  end


  def new
    
        @contenido = Contenido.buscar_ultimo_tmp(session[:user_id])
        
        if @contenido.nil?
           # Creo un nuevo contenido en estado borrador para que comience la edición del mismo
                @contenido = Contenido.new() 
                @contenido.estado = Contenido::ESTADO_TMP
                logger.debug("Aplicacion elegida:  #{App.find(:first)}")
                @contenido.app_id = App.find(:first)
                    
                hoy = Date::today()
        
                @contenido.fecha = hoy
                @contenido.tipo_id = TipoContenido.find(:first)
                
                @contenido.creador = session[:user_id]
                    
                # Salvando nuevo contenido
                @contenido.save!
                logger.debug("Se esta creando un nuevo contenido, ya que no existe ninguno tmp")
        else
          logger.debug("Se esta utilizando el último tmp creado")
          flash[:notice]= "Se ha recuperado un contenido guardado en borradores, si no se desea guardar debe seleccionar descartar.."
        end  
   # Alta de una nueva noticia

        logger.debug("############   Este es el contenido nuevo cargado: #{@contenido.id}")

        @hash_profiles_asociados = {}
        
        @profiles_all = Profile.obtener_profiles_entidad_actual(session[:profile_id]);
        
        if(@profiles_all.nil?)
            flash[:notice]= "No hay perfiles disponibles para asociar los contenidos"
            uri = session[:original_uri]
            redirect_to(uri || { :controller => "app_noticias" })
        end
        
        @tipo_contenidos_all = TipoContenido.find(:all)
        
        @modo_muestra_template = Contenido::MUESTRA_MODALIDAD_EDICION
        
        #Se ejecuta mostrar formato template para poder mostrar el template seleccionado cuando cargue la página
        mostrar_formato_template({:id => @contenido.tipo_id, :contenido_id => @contenido.id})
        
  end

  def crear_borrador_contenido(contenido_original_id)
    
        # Se obtienen el contenido por el id indicado
        @contenido_original = Contenido.find(contenido_original_id)
        
        #quito el id para que lo grabe como nuevo contenido
        @contenido_original.id = nil
        
        logger.debug("Se desea editar el contenido original id #{contenido_original_id}")

        logger.debug("voy a crear un borrador a partir de: #{@contenido_original}")
        nuevo_contenido = Contenido.new(@contenido_original.attributes)
        
        nuevo_contenido.id_version_previa = contenido_original_id
        nuevo_contenido.estado = Contenido::ESTADO_TMP
        nuevo_contenido.save!
        logger.debug("Generé una versión borrador con id: #{nuevo_contenido.id}")
        
        return nuevo_contenido
    
  end

  def crear_borrador_elementos_contenido(id_contenido_original, id_contenido_borrador)
    
      # Se obtienen los elementos asociados al contenido original para generar un borrador para los mismos.
      
      elementos_original = Elemento.find(:all, :conditions => "contenido_id = #{id_contenido_original}")
      logger.debug("Cargando los elementos originales asociados al contenido #{id_contenido_original}")
      
      elementos_nuevos = Array.new
      
      if !elementos_original.nil?
        
        for elemento in elementos_original
          
            logger.debug("Generando nuevo borrador para el elemento id: #{elemento.id}")
            elemento_nuevo = Elemento.new(elemento.attributes)
            elemento_nuevo.contenido_id = id_contenido_borrador
            elemento_nuevo.save!
            
            elementos_nuevos << elemento_nuevo
        end

        logger.debug("Se generaron elementos borradores para #{elementos_original.size} elementos.")
      else
        logger.debug("No hay elementos asociados al contenido id: #{id_contenido_original}.")
      end
        
      return elementos_nuevos
      
  end

  def crear_borrador_perfiles_contenido(id_contenido_original, id_contenido_borrador)
    
    # Se obtienen los profiles asociados al contenido original para generar un borrador para los mismos.
        
        profiles_original = ContenidoProfile.find(:all, :conditions => "contenido_id = #{id_contenido_original}")
        logger.debug("Cargando los profiles originales asociados al contenido #{id_contenido_original}")
        
        profiles_nuevos = Array.new
        
        if !profiles_original.nil?
          
          for profile in profiles_original
            
              logger.debug("Generando profiles asociados al borrador, ProfileId: #{profile.id}")
              profile_nuevo = ContenidoProfile.new(profile.attributes)
              profile_nuevo.contenido_id = id_contenido_borrador
              profile_nuevo.save!
              
              profiles_nuevos << profile_nuevo
              
          end

          logger.debug("Se genero asociacion para #{profiles_original.size} perfiles con el nuevo borrador")
        else
          logger.debug("No hay perfiles asociados al contenido id: #{id_contenido_original}")
      end
      
      return profiles_nuevos
          
  end


  # GET /apps/edit
  def edit
    
      @modo_muestra_template = Contenido::MUESTRA_MODALIDAD_EDICION
      
      begin
        
         Contenido.transaction do
              logger.debug("Voy a buscar si no hay un borrador en edición previo...")
              
              # Recupero si existe una versión borrador del contenido y si no la hay creo una nueva
              @contenido = Contenido.find(:first, :conditions => "id_version_previa = #{params[:id]} and estado = #{Contenido::ESTADO_TMP}")
              
                if @contenido.nil?
                    
                    logger.debug("No hay una versión previa que se haya querido editar, entonces voy a generar una nueva...")
                    
                    # se crea un borrador para la nueva edición del contenido en base a los datos del original
                    @contenido = crear_borrador_contenido(params[:id])
              
                    @elementos = crear_borrador_elementos_contenido(params[:id], @contenido.id)
              
                    @contenidos_profiles = crear_borrador_perfiles_contenido(params[:id], @contenido.id)
                
              else
                    flash[:notice] = "Atención: Modificaciones pendientes de guardar"
                    logger.debug("Se encontró una versión borrador con ID: #{@contenido.id}")
                    
                    # Se obtienen los elementos asociados al contenido borrador
                    @elementos = Elemento.find(:all, :conditions => "contenido_id = #{@contenido.id}")
              
                    # Se cargan todos los profiles asociados al contenido borrador encontrado
                    @contenidos_profiles = ContenidoProfile.find(:all, :conditions => "contenido_id = #{@contenido.id}")
                  
                end
                
              @hash_profiles_asociados = {}
              for contenido_profile in @contenidos_profiles
              
                    profile = Profile.find_by_id(contenido_profile.profile_id)
                    @hash_profiles_asociados[profile.id] = profile
               
              end
             
              # Obtengo todos los profiles de la Organización
              #@profiles = Profile.find(:all, :conditions => "entidad_id = #{}");
              if(!session[:profile_id].nil?)
                @profiles_all = Profile.obtener_profiles_entidad_actual(session[:profile_id]);
              end
              
              if(@profiles_all.nil?)
                  flash[:notice]= "No hay perfiles disponibles para asociar los contenidos"
                  uri = session[:original_uri]
                  redirect_to(uri || { :controller => "app_noticias" })
              end
          
              @tipo_contenidos_all = TipoContenido.find(:all)
              
              #Se ejecuta mostrar formato template para poder mostrar el template seleccionado cuando cargue la página
              mostrar_formato_template({:id => @contenido.tipo_id, :contenido_id => @contenido.id})

           end
      rescue Exception => e
        # force checking of errors even if products failed
        logger.error("Error al cargar la edición: #{e}")        
        flash[:notice] = "Error al guardar: " + e
        redirect_to :controller => :app_noticias, :action => :index
      end
         
         
  end
  
 
  def prueba_call_remote
    logger.debug("Entro a prueba")
    render :text=>"FECHA: #{DateTime.now.strftime(fmt='%d/%m/%Y %H:%M:%S')}"
   
  end
 
 
    # GET /app_noticias/save
  def save_contenido
    
        uri = session[:original_uri]
        
        logger.debug("La uri original es: #{uri}")
        
      # Inicia la transacción
      begin
        
        Contenido.transaction do
          
          contenido_id = params[:contenido][:id]
          
          logger.debug(" Salvando contenido existente id: #{contenido_id}")
          @contenido = Contenido.find(contenido_id)
    
          if  !params[:version_terminada].nil?
              
              logger.debug("Se trata de una version final, entonces se cambia el estado actual del borrador, para a estado sin auditar")
              @contenido.estado = Contenido::ESTADO_SIN_AUDITAR
              @contenido.save!
    
              logger.debug("La versión anterior del contenido se marca como tal (Contenido::ESTADO_REEMPLAZADO_POR_NUEVA_VERSION) ")
              if !@contenido.id_version_previa.nil?
                @contenido_version_anterior = Contenido.find(@contenido.id_version_previa)
                @contenido_version_anterior.estado = Contenido::ESTADO_REEMPLAZADO_POR_NUEVA_VERSION
                @contenido_version_anterior.save!
              end
              
          else
            logger.debug("No es una version final, es una actualización del contenido borrador id: #{contenido_id}")
          end
            
          # Actualizando los atributos del mismo 
          if !@contenido.update_attributes(params[:contenido])
              
              logger.error("Errores: + #{@contenido.errors.size}" )
              str_errores = ""
              for error in @contenido.errors
                logger.error("Error: " + error[1])
                str_errores += error[1] + "<br>"
              end
              flash[:notice] = 'Ocurrió un error al actualizar el contenido: ' + str_errores 
              raise ActiveRecord::RecordInvalid.new(@contenido)
           end
    
    #       # Salvando los elementos del contenido
    #       actualizarElementosContenido()
    #
           # Salvando asociaciones del contenido con los profiles habilitados
           asociarContenidoAPerfiles()
    
           # Si no hubieron errores vuelvo a la pantalla inicial
            respond_to do |format|
              format.html { redirect_to :controller => :app_noticias, :action => "index" }
              format.js  { render :text=>"Registro guardado: FECHA: #{DateTime.now.strftime(fmt='%d/%m/%Y %H:%M:%S')}" }
              
            end
        end
      rescue ActiveRecord::RecordInvalid => e
        # force checking of errors even if products failed
        
        flash[:notice] = "Error al guardar: " + e
        redirect_to :controller => :app_noticias, :action => :edit
      end

  end

  
  def mostrar_formato_template(params = params)
    
    logger.debug("Arrancó el mostrar_formato_template, con los parametros: #{params}")
        
    begin
        # obtengo el tipo de template a partir del id pasado
        @tipo_template = TipoContenido.find(params[:id])
        
        @contenido = Contenido.find(params[:contenido_id])
        
        @elementos = Elemento.find(:all, :conditions => "contenido_id = #{params[:contenido_id]}")
        
       
        logger.debug("Se encontro el tipo template: #{@tipo_template.id} con template: #{@tipo_template.template}")
    rescue ActiveRecord::RecordNotFound => err
        logger.debug("Error al buscar el template id : #{params[:id]}. #{err}")
        @tipo_template = nil
    end
    
    @modo_muestra_template = Contenido::MUESTRA_MODALIDAD_EDICION

    respond_to do |format|
      format.html {}
      format.xml  { head :ok }
      format.js   {}
    end
    
    
    logger.debug("Terminó el mostrar_formato_template")
       
  end
  

  # DELETE /apps/1
  # DELETE /apps/1.xml
  def destroy
    
    begin
        @elementos = Elemento.find(:all, :conditions => "contenido_id = #{params[:contenido][:id]}")
        
        for elemento in @elementos
          elemento.destroy!
        end
        
        @contenidos_profiles = ContenidoProfile.find(:all, :conditions => "contenido_id = #{params[:contenido][:id]}")
        
        for cont_prof in @contenidos_profiles
          cont_prof.destroy!
        end
        
        @contenido = Contenido.find(params[:contenido][:id])
        @contenido.destroy
        
    rescue Exception => err
        logger.debug("Error al eliminar el contenido : #{params[:contenido][:id]}")
        @tipo_template = nil
    end

    respond_to do |format|
      format.html { redirect_to(apps_url) }
      format.xml  { head :ok }
    end
  end 

  
private 


  # Recorre la lista de elementos pasada, si hay cambio en los mismos los actualiza y si hay nuevos los agrega
  # Params: :elementos[], :contenido
  def actualizarElementosContenido


           contenido_id = @contenido.id 
    
          # Se borran elementos originales del contenido
            @elementos_asociados = Elemento.find(:all, :conditions => "contenido_id = #{@contenido.id }")
            
            for elemento in @elementos_asociados
                    elemento.destroy
            end
            

            @elementos = params[:elemento]
            logger.debug("Esta es la cantidad de elementos para grabar nuevos: #{@elementos.size()}"  )
            if (!@elementos.nil? && @elementos.size() > 0 )
              
                      # Guardando los nuevos elementos
                      @elementos.each do |elemento|

                                  campos = elemento[1]  # 1 corresponde al hash de campos / 0 es el id del elemento actual
                                  
                                  elemento_nuevo = Elemento.new()
                                  elemento_nuevo.id = campos[:id]
                                  elemento_nuevo.ubicacion = campos[:ubicacion] 
                                  elemento_nuevo.contenido_id = contenido_id
                                  elemento_nuevo.valor = campos[:valor]
                                  elemento_nuevo.tipo_id = campos[:tipo_id]
                                  
                                  # Salvo
                                  elemento_nuevo.save!
         
                      end
              end 
  end

  # Asocia una lista de profiles a un contenido determinado
  # Params: :profiles[], :contenido 
  def asociarContenidoAPerfiles
    
          # Se borran asociaciones previas al contenido
            @contenidos_profiles = ContenidoProfile.find(:all, :conditions => "contenido_id = #{@contenido.id }")
            
            for contenido_profile in @contenidos_profiles
                    contenido_profile.destroy
            end
            

            @profiles = params[:profiles]
            
            logger.debug("#################### CANTIDAD DE PROFILES A ASOCIAR: #{@profiles.size}")
            if (!@profiles.nil? && @profiles.size() > 0 )
              
                      # Guardando las nuevas asociaciones
                      for profile in @profiles
                              logger.debug("Contenido del profile: #{profile}")
                              
                                  contenido_profile = ContenidoProfile.new()
                                  contenido_profile.profile_id = profile
                                  contenido_profile.contenido_id = @contenido.id 
                                  contenido_profile.save!
          
                      end
              end 
  end
  
  
end