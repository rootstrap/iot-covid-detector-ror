# == Schema Information
#
# Table name: devices
#
#  id          :bigint           not null, primary key
#  description :string
#  os          :integer
#  name        :string
#
class Device < ApplicationRecord
  has_many :sensors, dependent: :restrict_with_error

  enum os: { android: 0, windows: 1, other: 2 }

  validates :name, presence: true
  validates :name, uniqueness: true
end
