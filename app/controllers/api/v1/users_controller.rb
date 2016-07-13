class Api::V1::UsersController < ApplicationController
  respond_to:json

  before_action :authenticate_user!

  def index
    if current_user.is_admin?
      users = User.all
      respond_with users
    else
      respond_with :unauthorized
    end
  end

  def create
    user = User.new(admin_params)
    user.save
    respond_with user, location: nil
  end

  def destroy
    respond_with User.destroy(params[:id])
  end
  
  private

  def admin_params
    params.permit(:id, :email, :password, :password_confirmation)
  end
end