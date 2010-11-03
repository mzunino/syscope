class AddFechaToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :fecha, :date
  end

  def self.down
    remove_column :contenidos, :fecha
  end
end
