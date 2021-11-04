class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :post_category, required: true
  belongs_to :creator, class_name: 'User', required: true
end
