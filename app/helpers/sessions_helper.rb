module SessionsHelper
  
  #ログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #現在のユーザー
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  #ログインしているかどうか
  def logged_in?
    !current_user.nil?
  end
  
  #ログアウトする
  def log_out
    reset_session
    @current_user = nil
  end
end
