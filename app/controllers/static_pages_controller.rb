class StaticPagesController < ApplicationController
  def home
    @groups = Group.all
  end
end
