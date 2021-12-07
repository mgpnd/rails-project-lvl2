# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  has_ancestry

  validates :content, presence: true
end
