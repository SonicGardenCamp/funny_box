class GroupsController < ApplicationController
  before_action :logged_in_user, except: %i[index]
  before_action :set_group, only: %i[show edit destroy update]
  before_action :require_host_user!, only: %i[edit destroy update]

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
    if @group.save_and_participate(current_user)
      redirect_to @group
    else
      render "new", status: :unprocessable_entity
    end
  end

  #newと同じ
  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to @group
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
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

    def require_host_user!
      redirect_to(root_url, status: :see_other) unless @group.host_user?(current_user)
    end
end
