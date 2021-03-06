class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types(:danger)



  private

    def require_signin
      unless current_user
        redirect_to new_session_url, alert: "Please sign in first!"
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_user?(user)
      user == current_user
    end

    def require_admin
      unless current_user_admin?
        redirect_to root_url, alert: "Unauthorized access!"
      end
    end

    def current_user_admin?
      current_user && current_user.admin?
    end

    helper_method :current_user?

    helper_method :current_user

    helper_method :require_admin

    helper_method :current_user_admin?

end
