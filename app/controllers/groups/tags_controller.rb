class Groups::TagsController < Groups::BaseController
  before_action :require_host_user!

  def create
    if @group.add_tag(tag_params[:name])
      redirect_to @group
    else
      render "groups/show"
    end
  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def require_host_user!
    redirect_to(root_url, status: :see_other) unless @group.host_user?(current_user)
  end
end
