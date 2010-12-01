class AddIdVersionPreviaToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :id_version_previa, :integer
  end

  def self.down
    remove_column :contenidos, :id_version_previa
  end
end
