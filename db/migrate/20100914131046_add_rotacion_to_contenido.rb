class AddRotacionToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :rotacion, :integer
  end

  def self.down
    remove_column :contenidos, :rotacion
  end
end
