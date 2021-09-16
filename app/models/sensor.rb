# == Schema Information
#
# Table name: sensors
#
#  id          :bigint           not null, primary key
#  device_id   :bigint
#  description :string
#  external_id :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_sensors_on_device_id    (device_id)
#  index_sensors_on_external_id  (external_id) UNIQUE
#
class Sensor < ApplicationRecord
  belongs_to :device

  has_many :measures, dependent: :destroy

  validates :external_id, presence: true
  validates :external_id, uniqueness: true
end
