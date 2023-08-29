class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end
 
  def new
    @group = Group.new
  end
  
  def create
    # 仮実装 current_userで実装
    user = User.find(1)
    @group = user.groups.build(group_params)
    # ホスト機能
    # @group.host_user_id = current_user.id
    if @group.save
      @group.users << user
      redirect_to @group
    else
      render "new", status: :unprocessable_entity
    end
  end
  
  def show
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def edit
    @group = Group.find(params[:id])
  end

  def add_user
    # 仮実装 current_userで実装
    user = User.find(2)
    @group = Group.find(params[:id])
    unless @group.users.include?(user)
      @group.users << user
      redirect_to @group
    else
      @group.users.delete(user)
      redirect_to groups_path
    end
  end


  
  private 
  
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
