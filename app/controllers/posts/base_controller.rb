module Posts
  class BaseController < ApplicationController
    def post
      @post ||= Post.find(params[:post_id])
    end
  end
end
