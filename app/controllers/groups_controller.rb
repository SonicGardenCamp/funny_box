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
    @posts = @group.posts
    @post  = Post.new
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group
    else
      render "edit", status: :unprocessable_entity
    end
  end
  
  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "グループが削除されました"
    redirect_to groups_url, status: :see_other
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
