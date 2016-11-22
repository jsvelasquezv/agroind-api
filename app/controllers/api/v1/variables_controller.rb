class Api::v1::VariablesController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def show
    variable = Variable.find(variable_params[:id])
    respond_with variable
  end

  def index
    variables = Variable.all
    respond_with variables
  end

  def create
    variable = Variable.new(variable_params)
    if variable.save
      respond_with variable
    end
  end

  def update
    variable = Variable.find(variable_params[:id])
    variable.update_attributes(variable_params)
    respond_with variable
  end

  def destroy
    respond_with Variable.destroy(params[:id])
  end

  private

  def variable_params
    params.permit(:id, :name, :indicator_id)
  end
    
end