class StaticPagesController < ApplicationController
  def home
    @groups = Group.includes(:posts).joins(:posts).order('posts.created_at DESC')
  end
end
