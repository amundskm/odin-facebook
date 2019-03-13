class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    
    def create
        @post = current_user.posts.build(post_params)
        @post.save
        redirect_to current_user
    end

    private

    def post_params
        params.require(:post).permit(:content)
      end
end
