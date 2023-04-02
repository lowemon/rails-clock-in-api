class UsersController < ApplicationController
  # Test -- Retrieve all Users and ID will remove
  def index
    @users = User.all
    render json: @users
  end
end
