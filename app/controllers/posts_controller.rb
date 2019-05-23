class PostsController < ApplicationController
    include ApplicationHelper
    before_action :authenticate_user!
    def new
        @post = Post.new
    end

    def create

        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_back_or root_url
        else
            render 'new'
        end
    end

    def index
        @posts = Post.where(user_id: current_user.friend_ids)
        store_location
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_back_or root_url
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_back or root_url
    end

    private
        def post_params
            params.require(:post).permit(:content)
        end

        def correct_user
            @post = current_user.posts.find_by(id: params[:id])
            redirect_to root_url if @post.nil?
        end
end
