class Contenido < ActiveRecord::Base
  
  
  has_many :elementos
  has_one :tipo_contenido
  
  validates_presence_of :app_id, :message => 'Se debe especificar una aplicación para este contenido'
  #validate :fecha?
  
  
  # Constantes con los diferentes estados de un contenido
  ESTADO_TMP = 0
  ESTADO_SIN_AUDITAR = 1
  ESTADO_AUDITADO = 2
  ESTADO_REEMPLAZADO_POR_NUEVA_VERSION = 3

  # Definicion constantes con diferentes muestreos
  MUESTRA_MODALIDAD_REDUCIDA = 0
  MUESTRA_MODALIDAD_EDICION = 1
  MUESTRA_MODALIDAD_COMPLETA = 2

  def fecha?
    unless Chronic.parse(fecha)
      errors.add(:fecha, "La fecha ingresada no es correcta")
    end
  end

  
  protected
  
  
  def self.buscar_ultimo_tmp(usuario_id)
    
    
    
    contenido = Contenido.find(:first, :conditions => " creador = #{usuario_id} and estado = #{ESTADO_TMP} ", :order => " fecha desc")
    
    return contenido
  end
  
  def self.contenido_disponible_al_perfil(contenido_id, profile_id)
    
    if profile_id.nil?
      
      logger.debug("Buscando si el contenido id: #{contenido_id} se puede mostrar al profile id:#{profile_id}")
      
      # si el profile es null debo revisar si el contenido esta disponible para algun otro profile o es 
      # publico
      contenidos = ContenidoProfile.find(:all, :conditions => "contenido_id = #{contenido_id}")
      
      
      # Si el contenido no esta asociado a ningun perfil 
      # se da por sentado que es de contenido público
      if ( contenidos.size() == 0 )
        logger.debug("****** EL CONTENIDO #{contenido_id} se puede mostrar!!!")
        return true
      else
        return false
      end		
    else
      
      logger.debug("Buscando si el contenido id: #{contenido_id} se puede mostrar al profile id:#{profile_id}")
      
      contenido = ContenidoProfile.find(:all, :conditions => "(contenido_id = #{contenido_id} and profile_id = #{profile_id})") 
      
      # Si el contenido no existe para el perfil no se podrá mostrar 
      if (contenido.nil?)
        return false 
      else
        return true 
      end
    end
    
  end 
  
  def self.find_noticias_activas_del_perfil(profile_id)
    
    #logger.debug("Buscando noticias para el perfil: " + profile_id)
    
    if profile_id.nil?
      
      self.find(:all, :joins => " left join contenido_profiles as cont_pro on contenidos.id = cont_pro.contenido_id ",
                                :conditions => " cont_pro.contenido_id is null and estado = #{Contenido::ESTADO_AUDITADO}")
      
    else
      self.find(:all, :conditions => "profile_id = #{profile_id} and estado = #{Contenido::ESTADO_AUDITADO}" , 
                            :joins => " as contenidos join contenido_profiles as cont_pro on cont_pro.contenido_id = contenidos.id" )
    end
    
  end
  
  
end
