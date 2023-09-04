class StaticPagesController < ApplicationController
  def home
    @groups = Group.includes(:posts).joins(:posts).order(last_posted_at: :desc).first(3)
  end
end
