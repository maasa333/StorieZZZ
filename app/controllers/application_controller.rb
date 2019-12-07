class ApplicationController < ActionController::Base
    helper_method :logged_in?, :redirect_if_not_logged_in

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to "/"
        end
    end
end