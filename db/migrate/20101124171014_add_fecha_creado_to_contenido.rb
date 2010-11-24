class AddFechaCreadoToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :fecha_creado, :date
  end

  def self.down
    remove_column :contenidos, :fecha_creado
  end
end
