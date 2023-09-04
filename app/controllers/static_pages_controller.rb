class StaticPagesController < ApplicationController
  def home
    @groups = Group.order(last_posted_at: :desc).first(3)
  end
end
