class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end
    def create
        @user = User.create(user_params)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: 'Failed to create user'}, status: :not_acceptable
        end
    end
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: 'Failed to login'}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end
