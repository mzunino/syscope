class AddCreadorToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :creador, :string
  end

  def self.down
    remove_column :contenidos, :creador
  end
end
