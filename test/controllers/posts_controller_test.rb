# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test '#show' do
    post = FactoryBot.create(:post)

    get post_path(post)
    assert_response :success
  end

  test '#new' do
    user = FactoryBot.create(:user)
    sign_in user

    get new_post_path
    assert_response :success
  end

  test '#create' do
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:post_category)
    attributes = FactoryBot.attributes_for(:post, post_category_id: category.id)
    sign_in user

    post posts_path, params: { post: attributes }
    assert_response :redirect

    post = Post.find_by(attributes)
    assert { post.present? }
    assert { post.creator == user }
  end
end
