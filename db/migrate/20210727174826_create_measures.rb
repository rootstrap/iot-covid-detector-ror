class CreateMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :measures do |t|
      t.belongs_to :sensor
      t.float :value, null: false

      t.timestamps
    end
  end
end
