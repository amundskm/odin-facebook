class FriendRequestsController < ApplicationController
    def create
        user = User.find(params[:receiver_id])
        current_user.send_friend_request(user)
        redirect_to users_path
    end

    def index
        @friend_requests = current_user.received_friend_requests
        redirect_to friend_requests_path
    end
end
