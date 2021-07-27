# == Schema Information
#
# Table name: sensors
#
#  id          :bigint           not null, primary key
#  device_id   :bigint
#  description :string
#
# Indexes
#
#  index_sensors_on_device_id  (device_id)
#
class Sensor < ApplicationRecord
  belongs_to :device

  has_many :measures, dependent: :destroy
end
