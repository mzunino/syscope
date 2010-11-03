class AddNivelToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :nivel, :integer
  end

  def self.down
    remove_column :profiles, :nivel
  end
end
