class CreateFuncApps < ActiveRecord::Migration
  def self.up
    create_table :func_apps do |t|
      t.integer :app_id, :null => true, :options => "CONSTRAINT fk_app REFERENCES apps(id)"
      t.string :nombre
      t.string :action
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :func_apps
  end
end
