# frozen_string_literal: true

class AddNameToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :name, :string
    add_index :devices, :name, unique: true
  end
end
