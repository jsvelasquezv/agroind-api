class Api::V1::ProfilesController < ApplicationController
  include Devise::Controllers::Helpers
  respont_to :json

  before_action :authenticate_api_v1_user!
  
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

  def destroy
    if current_api_v1_user.can_manage_profiles?
      respond_with User.destroy(params[:id])
    else
      respond_with :unauthorized
    end
  end
  
  private

  def profile_params
    params.permit(:id, name:, users_permission:, indicators_permission:, reports_permission:, statistics_permission:, profiles_permission:)
  end
end
