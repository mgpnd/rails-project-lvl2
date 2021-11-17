# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :post_category, optional: false
  belongs_to :creator, class_name: 'User', optional: false

  has_many :comments, class_name: 'Post::Comment', inverse_of: :post
end
