module SessionsHelper
  def login_user
    session[:user_id] = user.id
    session[:user_group] = user.group
    flash[:sucess] = "Logged in as #{user.username}!"

    redirect_to articles_path
  end

  def login_fail
    flash[:danger] = 'Invalid username or password'

    redirect_to :login
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
