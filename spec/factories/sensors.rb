# frozen_string_literal: true

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
FactoryBot.define do
  factory :sensor do
    device
    description { Faker::Lorem.sentence }
    external_id { rand(10...100) }
  end
end
