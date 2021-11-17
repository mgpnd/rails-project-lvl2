module Posts
  class CommentsController < BaseController
    before_action :authenticate_user!, only: %i[create]

    def create
      comment = Post::Comment.new(
        post: post,
        author: current_user,
        **comment_params
      )

      if comment.save
        redirect_to post
      else
        @comment = comment
        render 'posts/show'
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content)
    end
  end
end
