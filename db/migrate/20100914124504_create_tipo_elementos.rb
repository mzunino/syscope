class CreateTipoElementos < ActiveRecord::Migration
  def self.up
    create_table :tipo_elementos do |t|
      t.string :template
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_elementos
  end
end
