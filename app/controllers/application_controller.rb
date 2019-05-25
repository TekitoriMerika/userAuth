class ApplicationController < ActionController::Base
	 protect_from_forgery
    protected
    def authenticte_user
        unless session[:user_id]
            redirect_to(:controller => 'sessions', :action => 'login')
            return true
        else
            @current_user = User.find session[:user_id]
                return true
        end
    end

    def save_login_state
        if session[:user_id]
            redirect_to(:controller => 'session', :action => 'home')
            return false
        else
            return true
        end
    end
end
