class Groups::BaseController < ApplicationController
  before_action :set_group

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end
