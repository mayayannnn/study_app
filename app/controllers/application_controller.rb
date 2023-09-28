class ApplicationController < ActionController::Base
    add_flash_types :success, :info, :warning, :danger
    def authenticate_user
        if session[:user_id] == nil
        redirect_to("/login")
        end
    end
end
