class Api::V1::IndicatorsController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def show
    indicator = Indicator.find(indicator_params[:id])
    respond_with indicator
  end

  def index
    indicators = Indicator.all
    respond_with indicators
  end

  def create
    indicator = Indicator.new(indicator_params)
    if indicator.save
      respond_with indicator, location: nil
    end
  end

  def update
    indicator = Indicator.find(indicator_params[:id])
    indicator.update_attributes(indicator_params)
    respond_with indicator, location: nil
  end

  def destroy
    respond_with Indicator.destroy(params[:id])
  end

  private

  def indicator_params
    params.permit(:id, :name,)
  end
    
end