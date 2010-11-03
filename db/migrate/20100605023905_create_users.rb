class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt
      t.integer :profile_id, :null => false, :options => "CONSTRAINT fk_profiles REFERENCES profiles(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
