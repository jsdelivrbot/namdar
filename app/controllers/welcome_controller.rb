class WelcomeController < ApplicationController
  def index
  end

  def login
    render :login
  end

  def authenticate
    user = User.authenticate(params.require(:username))

    if user
      session[:user_id] = user.id
      session[:user_group] = user.group

      redirect_to articles_path
    else
      session[:user_group] = 'user'
      redirect_to 'login'
    end
  end
end
