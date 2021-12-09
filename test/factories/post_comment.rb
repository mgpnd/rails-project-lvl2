# frozen_string_literal: true

FactoryBot.define do
  factory :post_comment do
    content { Faker::Lorem.sentence }
  end
end
