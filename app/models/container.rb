class Container < ActiveRecord::Base

	def mostrar_template(id)
        	@container = Container.find(id)
	        return @container.template
	end


end
