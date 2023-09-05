class CapsuleToysController < ApplicationController
  def show
    @result = Group::CATEGORIES.sample
    @groups = Group.where(category: @result )
  end
end
