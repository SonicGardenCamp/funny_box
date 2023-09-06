class GroupsController < ApplicationController
  before_action :logged_in_user, only:[:new, :create, :enter_leave]
  before_action :host_user, only:[:edit, :destroy, :update, :create_tag]
  before_action :set_group, only: %i[show]

  def index
    @q = Group.ransack(params[:q])
    @result = @q.result.order(last_posted_at: :desc).page(params[:page])
  end

  def show
  end

  # ここの@groupも1回しか使ってなさそう？
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

  #パーシャル化かモデルにうつす？
  def enter_leave
    @group = Group.find(params[:id])
    if @group.host_user_id == current_user.id
      redirect_to @group
    elsif @group.users.include?(current_user)
      @group.users.delete(current_user)
      redirect_to groups_path
    else
      @group.users << current_user
      redirect_to @group
    end
  end

  #newと同じ
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
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :description, :category)
    end

    #Application_controllerにうつす
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

    def tag_params
      params.require(:tag).permit(:name, :group_id)
    end

end
