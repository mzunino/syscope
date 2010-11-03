class AddFechaInicioToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :fecha_inicio, :date
  end

  def self.down
    remove_column :contenidos, :fecha_inicio
  end
end
