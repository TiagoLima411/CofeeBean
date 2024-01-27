# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    id { 1 }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.email }
  end
end
