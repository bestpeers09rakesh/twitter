class ApplicationController < ActionController::Base

  before_action :current_user
  private
    def current_user
      if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
      end
    end

    def logged_in?
      if Current.user
        true
      end
    end

    def require_login
      unless logged_in?
        flash[:alert] = "You must be logged in"
        redirect_to new_session_path
      end
    end

    def already_login
      if logged_in?
        flash[:alert] = "You have already logged in"
        redirect_to root_path
      end
    end 
end
