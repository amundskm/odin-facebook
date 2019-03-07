class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(:id)
  end
end
