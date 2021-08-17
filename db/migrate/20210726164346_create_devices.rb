# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :description
      t.integer :os
      t.integer :external_id

      t.timestamps
    end
    add_index :devices, :external_id, unique: true
  end
end
