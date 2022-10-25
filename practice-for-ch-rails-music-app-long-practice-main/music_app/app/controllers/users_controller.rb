class UsersController < ApplicationController
    before_action :require_logged_out
    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to music_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(user_params)
        @user[:email]
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
