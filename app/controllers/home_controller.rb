# frozen_string_literal: true

class HomeController < ApplicationController
  def index;
    @posts = Post.all.preload(:creator).order(created_at: :desc)
  end
end
