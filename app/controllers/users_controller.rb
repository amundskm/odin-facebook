class UsersController < ApplicationController
  include ApplicationHelper

  def index
    no_show = current_user.friends.ids
    no_show += current_user.pending_friend_requests.pluck(:receiver_id)
    no_show << current_user.id
    @users = User.where.not(id: no_show)
    @friends = current_user.friends
    @post =  Post.new
  end

  def show
    @user = User.find(params[:id])
    store_location
  end

end
