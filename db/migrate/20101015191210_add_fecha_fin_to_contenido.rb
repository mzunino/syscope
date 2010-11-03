class AddFechaFinToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :fecha_fin, :date
  end

  def self.down
    remove_column :contenidos, :fecha_fin
  end
end
