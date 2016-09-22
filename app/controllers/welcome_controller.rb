class WelcomeController < ApplicationController
  def index
  end

  def login
    render :login
  end

  def authenticate
    u = User.find_by(:username => params.require(:username))
    user = u.authenticate(params.require(:password)) if u

    if user
      session[:user_id] = user.id
      session[:user_group] = user.group
      flash[:sucess] = "Logged in as #{user.username}!"

      redirect_to articles_path
    else
      session[:user_group] = 'user'
      flash[:danger] = 'Invalid username or password'

      redirect_to :login
    end
  end
end
