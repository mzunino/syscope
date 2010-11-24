class AddAuditorToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :auditor, :string
  end

  def self.down
    remove_column :contenidos, :auditor
  end
end
