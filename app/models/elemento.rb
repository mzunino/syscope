class Elemento < ActiveRecord::Base

	belongs_to :contenido
	has_one :tipo_elemento

end
