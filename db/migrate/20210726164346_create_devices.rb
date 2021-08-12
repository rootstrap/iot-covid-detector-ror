# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :description
      t.integer :os

      t.timestamps
    end
  end
end
