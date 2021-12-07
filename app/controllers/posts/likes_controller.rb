# frozen_string_literal: true

module Posts
  class LikesController < BaseController
    before_action :authenticate_user!

    def create
      PostLike.create!(
        post: post,
        user: current_user
      )

      redirect_to post
    end

    def destroy
      like = PostLike.find(params[:id])
      like.destroy

      redirect_to post
    end
  end
end
