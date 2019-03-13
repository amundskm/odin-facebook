class CommentsController < ApplicationController

    def new
        @comment = Comment.new(commentable_id: params[:commentable_id], commentable_type: params[:commentable_type])
    end

    def create
        commentable_id = params[:comment][:commentable_id]
        commentable_type = params[:comment][:commentable_type]
        if commentable_type == "post"
            parent = Post.find(params[:comment][:commentable_id])
        elsif commentable_type == "comment"
            parent = Comment.find(params[:comment][:commentable_id])
        end
        @comment = parent.comments.build(content: params[:comment][:content], user_id: current_user.id)
        @comment.save
        redirect_to current_user
    end
end
