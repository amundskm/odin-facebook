class UsersController < ApplicationController
  
  def index
    @users = User.all
    @post =  Post.new
  end

  def show
    @user = User.find(params[:id])
  end

end
