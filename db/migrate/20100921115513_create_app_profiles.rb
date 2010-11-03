class CreateAppProfiles < ActiveRecord::Migration
  def self.up
    create_table :app_profiles do |t|
      t.integer :app_id, :null => true, :options => "CONSTRAINT fk_app REFERENCES apps(id)"

      t.integer :profile_id, :null => true, :options => "CONSTRAINT fk_profile REFERENCES profiles(id)"


      t.timestamps
    end
  end

  def self.down
    drop_table :app_profiles
  end
end
