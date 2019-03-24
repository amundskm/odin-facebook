class FriendshipsController < ApplicationController
    def create
        current_user.become_friends(User.find(params[:friend_id]))
        FriendRequest.find(params[:friend_request_id]).destroy
        redirect_to friend_requests_path
    end
end
