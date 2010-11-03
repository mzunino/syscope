class Contenido < ActiveRecord::Base
  
  
  has_many :elementos
  has_one :tipo_contenido
  
  validates_presence_of :app_id, :message => 'Se debe especificar una aplicación para este contenido'
  
  protected
  
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
  
  def self.find_noticias_del_perfil(profile_id)
    
    #logger.debug("Buscando noticias para el perfil: " + profile_id)
    
    if profile_id.nil?
      
      self.find(:all, :joins => " left join contenido_profiles as cont_pro on contenidos.id = cont_pro.contenido_id ", :conditions => " cont_pro.contenido_id is null ")
      
    else
      self.find(:all, :conditions => "profile_id = #{profile_id}" , :joins => " as contenidos join contenido_profiles as cont_pro on cont_pro.contenido_id = contenidos.id" )
    end
    
  end
  
  
end
