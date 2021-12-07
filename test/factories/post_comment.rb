# frozen_string_literal: true

FactoryBot.define do
  factory :post_comment, class: 'Post::Comment' do
    content { Faker::Lorem.sentence }
    association :author, factory: :user
    association :post
  end
end
