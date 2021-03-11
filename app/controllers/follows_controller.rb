class FollowsController < ApplicationController
    def index 
        follows = Follow.all
        render json: follows
    end

    def create 
        follow = Follow.create(follow_params)
        render json: follow
    end

    def destroy
        follow = Follow.find(params[:id])
        follow.destroy
        render json: follow
    end

    private
    def follow_params
        params.permit(:follower_id, :followee_id)
    end
end
