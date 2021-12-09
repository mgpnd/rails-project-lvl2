# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:first)
    @post = posts(:first)

    sign_in @user
  end

  test '#create' do
    post post_likes_path(post_id: @post.id)
    assert_response :redirect

    like = PostLike.find_by(user: @user, post: @post)
    assert { like.present? }
    assert { like.user == @user }
    assert { like.post == @post }
  end

  test '#destroy' do
    like = PostLike.create(user: @user, post: @post)

    delete post_like_path(id: like.id, post_id: @post.id)
    assert_response :redirect

    missing_like = PostLike.find_by(user: @user, post: @post)
    assert { missing_like.nil? }
  end
end
