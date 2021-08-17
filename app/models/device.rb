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

  enum os: { android: 0, windows: 1, other: 2 }
end
