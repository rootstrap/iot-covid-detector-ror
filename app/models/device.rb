# == Schema Information
#
# Table name: devices
#
#  id          :bigint           not null, primary key
#  description :string
#  os          :integer
#
class Device < ApplicationRecord
  has_many :sensors

  enum os: [ :android, :windows, :other ]
end
