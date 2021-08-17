# == Schema Information
#
# Table name: devices
#
#  id          :bigint           not null, primary key
#  description :string
#  os          :integer
#  external_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#
# Indexes
#
#  index_devices_on_external_id  (external_id) UNIQUE
#  index_devices_on_name         (name) UNIQUE
#
class Device < ApplicationRecord
  has_many :sensors, dependent: :restrict_with_error

  enum os: { android: 0, windows: 1, other: 2 }

  validates :name, :external_id, presence: true
  validates :name, :external_id, uniqueness: true
end
