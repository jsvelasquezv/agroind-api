class Api::v1::EvaluationsController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def show
    evaluation = Evaluation.find(evaluation_params[:id])
    respond_with evaluation
  end

  def index
    evaluations = Evaluation.all
    respond_with evaluations
  end

  def create
    evaluation = Evaluation.new(evaluation_params)
    if evaluation.save
      respond_with evaluation
    end
  end

  def update
    evaluation = Evaluation.find(evaluation_params[:id])
    evaluation.update_attributes(evaluation_params)
    respond_with evaluation
  end

  def destroy
    respond_with Evaluation.destroy(params[:id])
  end

  private

  def evaluation_params
    params.permit(:id, :name, :indicator_id)
  end
    
end