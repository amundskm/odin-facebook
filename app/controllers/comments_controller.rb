class CommentsController < ApplicationController
    include ApplicationHelper
    before_action :authenticate_user!
    def create
        @comment = Comment.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_back or root_url
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update_attributes(comment_params)
        redirect_back or root_url
    end

    def destroy
        @comment.destroy
        redirect_back or root_url
    end

    private
        def comment_params
            params.require(:comment).permit(:content, :commentable_id, :commentable_type)
        end

        def correct_user
            @comment = current_user.comments.find_by(id: params[:id])
            redirect_to root_url if @comment.nil?
        end

end
