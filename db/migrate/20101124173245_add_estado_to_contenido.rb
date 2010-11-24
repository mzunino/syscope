class AddEstadoToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :estado, :integer
  end

  def self.down
    remove_column :contenidos, :estado
  end
end
