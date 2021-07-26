# frozen_string_literal: true

FactoryBot.define do
  factory :sensor do
    device { create(device) }
    description { Faker::Lorem.sentence }
  end
end
