# frozen_string_literal: true

FactoryBot.define do
  factory :post_category do
    name { Faker::Coffee.variety }
  end
end
