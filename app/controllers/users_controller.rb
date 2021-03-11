class UsersController < ApplicationController
    before_action :authenticate, only: [:me, :update]

    def index
        users = User.all

        render json: users, include: ['posts', 'followers', 'followees', 'communities', 'memberships'], except: [:password_digest]
    end

    def show 
        users = User.find(params[:id])
        render json: users, include: ['posts', 'followers', 'followees', 'memberships', 'communities'], except: [:password_digest]
    end 

    def login 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = JWT.encode({user_id: user.id}, 'mysecret', 'HS256')
            render json:  { user: user, token: token }
        else
            render json:  {errors: ["Invalid username or password"], status: :unauthorized}
        end
    end

    def signup
        user = User.create(user_params)
        if user.valid?
            token = JWT.encode({user_id: user.id}, 'mysecret', 'HS256')
            render json:  { user: user, token: token }
        else
            render json: { errors: user.errors.full_messages }, status: :unauthorized
        end
    end

    def update
        user.update(user_params)
        render json: user 
    end

    def me
        render json: @current_user
    end


    private
    def user_params
        params.permit(:username, :password, :name)
    end
end
