class AddEntityToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :entity_id, :integer
  end

  def self.down
    remove_column :profiles, :entity_id
  end
end
