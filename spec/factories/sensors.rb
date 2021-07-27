# frozen_string_literal: true

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
FactoryBot.define do
  factory :sensor do
    device { create(device) }
    description { Faker::Lorem.sentence }
  end
end
