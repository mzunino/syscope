class AddAppToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :app_id, :integer, :null => true, :options => "CONSTRAINT fk_apps REFERENCES apps(id)"
  end

  def self.down
    remove_column :contenidos, :app_id
  end
end
