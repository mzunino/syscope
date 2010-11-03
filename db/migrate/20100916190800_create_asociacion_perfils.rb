class CreateAsociacionPerfils < ActiveRecord::Migration
  def self.up
    create_table :asociacion_perfils do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :asociacion_perfils
  end
end
