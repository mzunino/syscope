class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :identificador
      t.string :descripcion
      t.integer :container_id, :null => false, :options => "CONSTRAINT fk_profile_container REFERENCES containers(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
