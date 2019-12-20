class ApplicationController < ActionController::Base
    helper_method :logged_in?, :redirect_if_not_logged_in, :current_user, :format_date

    #add protection for delete/edit route
    #before_action for destroy action, does user own the current record

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to "/"
        end
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def format_date(date)
        date.strftime("%m/%d/%Y")
   end
end