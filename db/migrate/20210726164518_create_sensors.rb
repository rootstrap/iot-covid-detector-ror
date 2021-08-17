# frozen_string_literal: true

class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      t.belongs_to :device
      t.string :description
      t.integer :external_id

      t.timestamps
    end
    add_index :sensors, :external_id, unique: true
  end
end
