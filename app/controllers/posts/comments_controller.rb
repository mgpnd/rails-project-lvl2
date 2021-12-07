# frozen_string_literal: true

module Posts
  class CommentsController < BaseController
    before_action :authenticate_user!, only: %i[create]

    def create
      comment = PostComment.new(
        post: post,
        author: current_user,
        **comment_params
      )

      if comment.save
        redirect_to post
      else
        @comment = comment
        flash.now[:alert] = comment.errors.to_a.first
        render 'posts/show'
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
