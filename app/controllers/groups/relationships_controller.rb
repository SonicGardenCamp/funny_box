class Groups::RelationshipsController < Groups::BaseController
  def create
    if @group.participate(current_user)
      redirect_to @group
    else
      render "groups/show"
    end
  end

  def destroy
    if @group.leave(current_user)
      redirect_to @group
    else
      render "groups/show"
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
