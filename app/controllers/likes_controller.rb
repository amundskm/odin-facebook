class LikesController < ApplicationController
    include ApplicationHelper

    def create
        @like = current_user.likes.build(post_params)
        @like.save
        redirect_back_or root_url
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy
        redirect_back_or root_url
    end

    private
        def post_params
            params.require(:like).permit(:likeable_id, :likeable_type)
        end
end
