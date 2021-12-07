# frozen_string_literal: true

require 'test_helper'

class PostsCommentsControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    attributes = FactoryBot.attributes_for(
      :post_comment,
      user: user,
      post: post
    )

    sign_in user
    post post_comments_path(post_id: post.id), params: { post_comment: attributes }
    assert_response :redirect

    comment = PostComment.find_by(attributes)
    assert { comment.present? }
    assert { comment.user == user }
    assert { comment.post == post }
  end
end
