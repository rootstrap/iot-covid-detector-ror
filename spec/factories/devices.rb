# frozen_string_literal: true

FactoryBot.define do
  factory :device do
    description { Faker::Lorem.sentence }
    os { rand(0..2) }
  end
end
