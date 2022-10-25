class SessionController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]

    def new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
            flash.now[:errors] = ["Incorrect Username and/or Password"]
            render :new
        else
            login!(@user)
            #redirect_to homepage
        end
    end

    def destroy
        logout!
        #redirect_to new_session
    end
end
