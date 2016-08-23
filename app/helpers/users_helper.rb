module UsersHelper
  def current_user
    session[:user_id]
  end

  def require_user
    redirect users_login_path unless current_user
  end
end
