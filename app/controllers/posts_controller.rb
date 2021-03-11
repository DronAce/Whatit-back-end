class PostsController < ApplicationController
    def index
        posts = Post.all

        render json: posts, include: ['comments', 'likes']
    end

    def show
        post = Post.find(params[:id])
        render json: post, include: ['comments', 'likes']
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: post
    end

    def create
        post = Post.create(post_params)

        render json: post, include: ['comments', 'likes']
    end




    private

    def post_params
        params.permit(:title, :content, :user_id, :community_id)
    end

end
