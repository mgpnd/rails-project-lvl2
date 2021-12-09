# frozen_string_literal: true

require 'test_helper'

class PostsCommentsControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    user = users(:first)
    post = posts(:first)
    attributes = FactoryBot.attributes_for(
      :post_comment,
      user_id: user.id,
      post_id: post.id
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
