class AddFechaAuditadoToContenido < ActiveRecord::Migration
  def self.up
    add_column :contenidos, :fecha_auditado, :date
  end

  def self.down
    remove_column :contenidos, :fecha_auditado
  end
end
