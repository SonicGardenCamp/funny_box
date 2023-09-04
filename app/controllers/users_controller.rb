class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user, only:[:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    # TODO: 仮実装
    @groups = @user.groups.first(3)

  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "登録完了しました！"
      redirect_to @user
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # if @user.changed
        flash[:success] = "プロフィールが更新されました"
      # end
      redirect_to @user
    else
      render "edit" , status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                   :college, :profile)
    end

    #ログイン済みかの確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url, status: :see_other
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless @user == current_user
    end
end
