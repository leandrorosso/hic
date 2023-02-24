class AddTenantIdToMedics < ActiveRecord::Migration[7.0]
  def change
    add_column :medics, :tenant_id, :integer
  end
end
