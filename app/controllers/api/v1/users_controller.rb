class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: UserSerializer.format_users(users), status: :ok
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.format_user(user), status: :ok
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :username)
    end
end