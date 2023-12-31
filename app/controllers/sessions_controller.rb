class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session
      remember user
      log_in user
      flash[:success] = "ログインに成功しました"
      redirect_to forwarding_url || user
    else
      flash.now[:danger] = "メールアドレスかパスワードが間違っています"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "ログアウトしました"
    redirect_to root_url, status: :see_other
  end
end
