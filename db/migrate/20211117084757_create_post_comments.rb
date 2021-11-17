# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :content
      t.belongs_to :post, foreign_key: true
      t.belongs_to :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
