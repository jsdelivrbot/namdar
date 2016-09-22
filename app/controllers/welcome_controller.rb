class WelcomeController < ApplicationController
  def index
  end

  def login
    render :login
  end

  def authenticate
    redirect_to articles_path
  end
end
