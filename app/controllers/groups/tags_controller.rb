class Groups::TagsController < ApplicationController
  before_action :set_group

  def create
    if @group.add_tag(tag_params[:name])
      redirect_to @group
    else
      render "groups/show"
    end
  end

private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
