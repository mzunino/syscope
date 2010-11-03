class CreateElementos < ActiveRecord::Migration
  def self.up
    create_table :elementos do |t|
      t.integer :contenido_id, :null => false, :options => "CONSTRAINT fk_contenido_elementos REFERENCES contenidos(id)"
      t.text :valor
      t.integer :tipo_id, :null => false, :options => "CONSTRAINT fk_tipo_elementos REFERENCES tipo_elementos(id)"
      t.integer :ubicacion

      t.timestamps
    end
  end

  def self.down
    drop_table :elementos
  end
end
