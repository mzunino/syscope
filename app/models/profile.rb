class Profile < ActiveRecord::Base


	has_many :users
  
  belongs_to :entities

	validates_presence_of  :container_id, :message => 'Debe seleccionar un contenedor para el Perfil'
  
  validates_presence_of  :entity_id, :message => 'Debe seleccionar una entidad válida'


	NIVELES_DE_USUARIO = [['Usuario', 0], ['Administradores', 1]]

  # Se obtiene los profiles asociados a la entidad que se encuentra registrada en el sistema
  def self.obtener_profiles_entidad_actual(profile_id)
    
    
    logger.debug("+-+-+-+-+-+-+- Entrando a obtener_profiles_entidad_actual profile: #{profile_id}+-+-+-+-+-+-+-+-+-")
    
      profiles = nil
      if( !profile_id.nil? )
      
          profile = self.find(profile_id)
          
           if( !profile.nil? )
                  entity_id = profile.entity_id
          
                  logger.debug("+-+-+-+-+-+-+- Buscando profiles para la entidad: #{entity_id} +-+-+-+-+-+-+-+-+-")
      
                  profiles = Profile.find(:all, :conditions => "entity_id = #{entity_id}")
           end
          
      end
      
      logger.debug("+-+-+-+-+-+-+- Se encontraron #{profiles.size} profiles para la entidad #{entity_id} +-+-+-+-+-+-+-+-+-")
      return profiles
          
  end
  
end
