class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    u = User.find_by(username: params[:session][:username].downcase)
    user = u.authenticate(params[:session][:password]) if u

    if user
      login_user
    else
      login_fail
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to articles_path
  end

  private

  def login_user
    session[:user_id] = user.id
    flash[:sucess] = "Logged in as #{user.username}!"

    redirect_to articles_path
  end

  def login_fail
    flash[:danger] = 'Invalid username or password'

    redirect_to :login
  end
end
