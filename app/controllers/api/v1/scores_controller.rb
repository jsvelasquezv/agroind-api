class Api::V1::ScoresController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def show
    score = VariableScore.find(score_params[:id])
    respond_with score
  end

  def index
    scores = VariableScore.all
    respond_with scores
  end

  def create
    score = score.new(score_params)
    if score.save
      respond_with score, location: nil
    end
  end

  def update
    score = VariableScore.find(score_params[:id])
    score.update_attributes(score_params)
    respond_with score
  end

  def destroy
    # VariableScore.destroy(score_params[:id])
    VariableScore.delete_all
    # respond_with [], location: nil
  end

  private

  def score_params
    params.permit(:id, :land_id, :user_id)
  end

  def scores_params
    params.permit(:scores)
  end
    
end