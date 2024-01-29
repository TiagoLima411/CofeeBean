# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    id { 1 }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) }
  end
end
