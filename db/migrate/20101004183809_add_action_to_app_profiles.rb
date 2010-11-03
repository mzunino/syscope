class AddActionToAppProfiles < ActiveRecord::Migration
  def self.up
    add_column :app_profiles, :action, :string
  end

  def self.down
    remove_column :app_profiles, :action
  end
end
