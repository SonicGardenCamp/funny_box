class GroupsController < ApplicationController
  before_action :logged_in_user, only:[:new, :create, :add_user]
  before_action :host_user, only:[:edit, :destroy, :update]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @host_user  = User.find(@group.host_user_id)
    @users = @group.users
    @posts = @group.posts
    @post  = Post.new
  end

    def new
      @group = Group.new
    end

  def create
    @group = current_user.groups.build(group_params)
    @group.host_user_id = current_user.id
    if @group.save
      @group.users << current_user
      redirect_to @group
    else
      render "new", status: :unprocessable_entity
    end
  end

  def add_user
    @group = Group.find(params[:id])
    if @group.users.include?(current_user)
      @group.users.delete(current_user)
      redirect_to groups_path
    else
      @group.users << current_user
      redirect_to @group
    end
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

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url, status: :see_other
    end
  end

  def host_user
    @group = Group.find(params[:id])
    @host_user  = User.find(@group.host_user_id)
    redirect_to(root_url, status: :see_other) unless current_user == @host_user
  end

end
