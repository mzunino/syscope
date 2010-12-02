class AddCapturadorToTipoElemento < ActiveRecord::Migration
  def self.up
    add_column :tipo_elementos, :capturador, :string
  end

  def self.down
    remove_column :tipo_elementos, :capturador
  end
end
