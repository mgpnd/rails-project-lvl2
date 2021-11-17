# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @post = Post.find(params[:id])
    @comment = Post::Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_post_params)
    @post.creator = current_user

    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  private

  def create_post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
