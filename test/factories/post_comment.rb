# frozen_string_literal: true

FactoryBot.define do
  factory :post_comment do
    content { Faker::Lorem.sentence }
    association :user, factory: :user
    association :post
  end
end
