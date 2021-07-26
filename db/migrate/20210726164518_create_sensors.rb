# frozen_string_literal: true

class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      t.belongs_to :device
      t.string :description
    end
  end
end
