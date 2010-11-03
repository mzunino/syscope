class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.integer :id
      t.string :nombre
      t.string :controller
      t.integer :nivel

      t.timestamps
    end
  end

  def self.down
    drop_table :apps
  end
end
