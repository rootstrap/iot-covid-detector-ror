# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id          :bigint           not null, primary key
#  description :string
#  os          :integer
#  name        :string
#
FactoryBot.define do
  factory :device do
    name { Faker::Device.unique.model_name }
    description { Faker::Lorem.sentence }
    os { rand(0..2) }
  end
end
