class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        ##authenticate user credentials
        if !!@user && @user.authenticate(params[:password])
            #set session and redirec on success
            session[:user_id] = @user.id
            redirect_to categories_path
        else
            #erroer message on fail
            message = "Something went wrong, Please try again"
            redirect_to login_path, notice: message
        end
    end

    def home
     redirect_to categories_path
    end

end
