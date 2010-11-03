class CreateContenidos < ActiveRecord::Migration
  def self.up
    create_table :contenidos do |t|
      t.integer :tipo_id, :null => false, :options => "CONSTRAINT fk_tipo_contenido REFERENCES tipo_contenidos(id)"
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :contenidos
  end
end
