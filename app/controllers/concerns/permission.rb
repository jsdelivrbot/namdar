module Concerns
  module Permission
    def require_admin
      unless session[:user_id] and user = User.find(session[:user_id]) and user.admin?
        flash[:danger] = 'Permission Denied. Please Login.'
        redirect_to login_path
      end
    end
  end
end
