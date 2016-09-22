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
  end
end
