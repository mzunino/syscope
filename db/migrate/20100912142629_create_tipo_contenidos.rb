class CreateTipoContenidos < ActiveRecord::Migration
  def self.up
    create_table :tipo_contenidos do |t|
      t.string :template
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_contenidos
  end
end
