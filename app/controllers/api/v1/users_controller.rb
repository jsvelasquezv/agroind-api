class Api::V1::UsersController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to:json

  before_action :authenticate_api_v1_user!

  def index
    if current_api_v1_user.has_permission?('users_permission')
      users = User.all
      respond_with users
    else
      respond_with :unauthorized
    end
  end

  def show
    user = User.find(params[:id])
    respond_with user
  end

  def create
    if (current_api_v1_user.has_permission?('users_permission') and 
        current_api_v1_user.has_permission?('create_users'))
      user = User.new(admin_params)
      user.save
      respond_with user, location: nil
    else
      respond_with :unauthorized
    end
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(admin_params)
    respond_with user, location: nil
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
    params.permit(:id, :document, :name, :last_name, :address, :email, :password, :password_confirmation, :profile_id)
  end
end