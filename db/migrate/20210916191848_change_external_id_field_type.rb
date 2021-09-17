class ChangeExternalIdFieldType < ActiveRecord::Migration[6.0]
  def change
    change_column :devices, :external_id, :string
    change_column :sensors, :external_id, :string
  end
end
