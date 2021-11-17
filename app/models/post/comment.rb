# frozen_string_literal: true

class Post
  class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :author, class_name: 'User'

    has_ancestry

    validates :content, presence: true
  end
end
