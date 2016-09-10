class Api::V1::UsersController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to:json

  before_action :authenticate_api_v1_user!

  def index
    if current_api_v1_user.can_manage_users?
      users = User.all
      respond_with users
    else
      respond_with :unauthorized
    end
  end

  # def show
  #   user = User.find(params[:id])
  #   respond_with user
  # end

  def create
    if current_api_v1_user.can_manage_users?
      user = User.new(admin_params)
      user.save
      respond_with user, location: nil
    else
      respond_with :unauthorized
    end
  end

  def destroy
    if current_api_v1_user.can_manage_users?
      respond_with User.destroy(params[:id])
    else
      respond_with :unauthorized
    end
  end
  
  private

  def admin_params
    params.permit(:id, :email, :password, :password_confirmation, :profile_id)
  end
end