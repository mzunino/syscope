class CreateContenidoProfiles < ActiveRecord::Migration
  def self.up
    create_table :contenido_profiles do |t|
      t.integer :contenido_id, :null => false, :options => "CONSTRAINT fk_profile_contenido REFERENCES contenidos(id)"
      t.integer :profile_id, :null => true, :options => "CONSTRAINT fk_contenido_profile REFERENCES profiles(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :contenido_profiles
  end
end
