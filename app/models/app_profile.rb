class AppProfile < ActiveRecord::Base



        def self.find_aplicaciones_del_perfil(profile_id)

                if profile_id.nil?
                        condicion = "profile_id is null "
                else
                        condicion = "profile_id = #{profile_id}"
                end
                logger.debug("Con la condicion: " + condicion)

                self.find(:all, :conditions => condicion)


        end



end
