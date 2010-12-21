class ElementosController < ApplicationController
  # GET /elementos
  # GET /elementos.xml
  def index
    @elementos = Elemento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elementos }
    end
  end


  def nuevo_elemento
    
    elemento_id = params[:id]
    contenido_id = params[:contenido_id]
    ubicacion = params[:ubicacion]
    
    logger.debug("contenido_id: #{contenido_id}")
    logger.debug("elemento_id: #{elemento_id}")
    logger.debug("ubicacion: #{ubicacion}")
    
  
    if elemento_id.nil? || elemento_id == "0"
  
      # Si no quiere editar un elemento existente, entonces 
      # creo uno para empezar a editar
      @elemento = Elemento.new()
      @elemento.contenido_id = contenido_id
      @elemento.tipo_id = TipoElemento.find(:last);
      @elemento.ubicacion = ubicacion
      @elemento.save!
  
    else
      @elemento = Elemento.find(elemento_id)
    end 
    
    # muestra una noticia determinada
    render(:layout => false)
  
  end


  # GET /elementos/1
  # GET /elementos/1.xml
  def show
    @elemento = Elemento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @elemento }
    end
  end

  # GET /elementos/new
  # GET /elementos/new.xml
  def new
    @elemento = Elemento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @elemento }
    end
  end

  # GET /elementos/1/edit
  def edit
    @elemento = Elemento.find(params[:id])
  end

  # POST /elementos
  # POST /elementos.xml
  def create
    @elemento = Elemento.new(params[:elemento])

    respond_to do |format|
      if @elemento.save
        flash[:notice] = 'Elemento was successfully created.'
        format.html { redirect_to(@elemento) }
        format.xml  { render :xml => @elemento, :status => :created, :location => @elemento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @elemento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # PUT /elementos/salvar_elemento
  def salvar_elemento
    @elemento = Elemento.find(params[:id])


    logger.debug("El valor que debería guardar es: #{params[:elemento]}")
    if @elemento.update_attributes(params[:elemento])
   
        begin
          @contenido = Contenido.find(@elemento.contenido_id)
          
          @tipo_template = TipoContenido.find(@contenido.tipo_id)
          
          # obtengo el tipo de template a partir del id pasado
        
          @elementos = Elemento.find(:all, :conditions => "contenido_id = #{@contenido.id}")

        rescue ActiveRecord::RecordNotFound => err
            logger.debug("Error: #{params[:id]}. #{err}")
            @tipo_template = nil
        end

    else
            logger.error("Error al guardar el elemento: #{@elemento.errs}" )
    end
    logger.debug("Se encontro el tipo template: #{@tipo_template.id} con template: #{@tipo_template.template}")
    
    @modo_muestra_template = true
    
    respond_to { |format| format.js }
  
end



  def actualizar_capturador_tipo_elemento
     # Se implementa en actualizar_capturador_tipo_elemento.js.rjs
#     @tipo_elemento = TipoElemento.find(params[:id])
#     @form_actual = params[:form]
  end

  # DELETE /elementos/1
  # DELETE /elementos/1.xml
  def destroy
    @elemento = Elemento.find(params[:id])

    # Se carga el contenido y el tipo de contenido para actualizar la página luego
    @contenido = Contenido.find(@elemento.contenido_id)
    @tipo_template = TipoContenido.find(@contenido.tipo_id)
    
    @modo_muestra_template = true
    
    @elemento.destroy

    logger.debug("Ejecutando destroy de elemento!!!")

    respond_to { |format| format.js }
  end
  

  def update
    @elemento = Elemento.find(params[:id])

    respond_to do |format|
      if @elemento.update_attributes(params[:elemento])
        flash[:notice] = 'Elemento was successfully updated.'
        format.html { redirect_to(@elemento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @elemento.errors, :status => :unprocessable_entity }
      end
    end
  end
  

end
