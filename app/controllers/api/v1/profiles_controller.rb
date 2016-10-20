class Api::V1::ProfilesController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  before_action :authenticate_api_v1_user!

  def show
    profile = Profile.find(params[:id])
    respond_with profile
  end
  
  def index
    if current_api_v1_user.can_manage_profiles?
      profiles = Profile.all
      respond_with profiles
    else
      respond_with :unauthorized
    end
  end

  def create
    if current_api_v1_user.can_manage_profiles?
      profile = Profile.new(profile_params)
      profile.save
      respond_with profile, location: nil
    else
      respond_with :unauthorized
    end
  end

  def update
    profile = Profile.find(params[:id])
    profile.update_attributes(profile_params)
    respond_with profile, location: nil
  end

  def destroy
    if current_api_v1_user.can_manage_profiles?
      respond_with Profile.destroy(params[:id])
    else
      respond_with :unauthorized
    end
  end
  
  private

  def profile_params
    params.permit(:id, 
                  :name, 
                  :users_permission,
                  :list_users,
                  :create_users,
                  :edit_users,
                  :deactivate_users,
                  :indicators_permission, 
                  :reports_permission, 
                  :statistics_permission, 
                  :profiles_permission,
                  :list_profiles,
                  :create_profiles,
                  :edit_profiles,
                  :clone_profiles)
  end
end
