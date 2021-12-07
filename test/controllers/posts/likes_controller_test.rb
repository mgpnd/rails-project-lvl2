# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)

    sign_in @user
  end

  test '#create' do
    post post_likes_path(post_id: @post.id)
    assert_response :redirect

    like = PostLike.find_by(user: @user, post: @post)
    assert like.present?
    assert_equal like.user, @user
    assert_equal like.post, @post
  end

  test '#destroy' do
    PostLike.create(user: @user, post: @post)

    delete destroy_post_likes_path(post_id: @post.id)
    assert_response :redirect

    missing_like = PostLike.find_by(user: @user, post: @post)
    assert_not missing_like.present?
  end
end
