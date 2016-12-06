class Api::V1::LandsController < ApplicationController
  # include Devise::Controllers::Helpers
  respond_to :json

  # before_action :authenticate_api_v1_user!

  def show
    land = Land.find(params[:id])
    respond_with land
  end
  
  def index
    # if current_api_v1_user.has_permission?('lands_permission')
      lands = Land.all
      respond_with lands
    # else
      # respond_with :unauthorized
    # end
  end

  def create
    # if current_api_v1_user.has_permission?('lands_permission')
      land = Land.new(land_params)
      if land.valid?
        land.save
        respond_with land, location: nil
      else
        render :json => land.errors, status: 422
      end
    # else
      # respond_with :unauthorized
    # end
  end

  def update
    land = Land.find(params[:id])
    land.update_attributes(land_params)
    respond_with :ok, location: nil
  end

  def destroy
    if current_api_v1_user.has_permission?('lands_permission')
      respond_with Land.destroy(params[:id])
    else
      respond_with :unauthorized
    end
  end
  
  private

  def land_params
    params.permit(:id,
                  :propietary_document,
                  :name,
                  :zone,
                  :municipality,
                  :asnm,
                  :latitude,
                  :longitude,
                  :area,
                  :affiliation,
                  :users_id)
  end
end
