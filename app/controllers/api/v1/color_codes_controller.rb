class Api::V1::ColorCodesController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def show
    color_code = ColorCode.find(color_code_params[:id])
    respond_with color_code, location: nil
  end

  def index
    color_codes = ColorCode.all
    respond_with color_codes, location: nil
  end

  def create
    color_code = ColorCode.new(color_code_params)
    if color_code.save
      respond_with color_code, location: nil
    end
  end

  def update
    color_code = ColorCode.find(color_code_params[:id])
    color_code.update_attributes(color_code_params)
    respond_with color_code, location: nil
  end

  def destroy
    respond_with ColorCode.destroy(params[:id])
  end

  private

  def color_code_params
    params.permit(:id, :state, :min, :max, :color, :alert, :attention_time)
  end
    
end