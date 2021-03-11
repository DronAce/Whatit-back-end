class CommunitiesController < ApplicationController
    def index 
        communities = Community.all
        render json: communities, include: ['posts']
    end

    def create
        community = Community.create(community_params)
        render json: community, include: ['posts', 'users']
    end


    private
    def community_params
        params.permit(:name, :description)
    end
end
