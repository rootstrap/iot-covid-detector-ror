# frozen_string_literal: true

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
FactoryBot.define do
  factory :device do
    name { Faker::Device.unique.model_name }
    description { Faker::Lorem.sentence }
    os { rand(0..2) }
    external_id { rand(10...100) }
  end
end
