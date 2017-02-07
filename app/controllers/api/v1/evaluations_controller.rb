class Api::V1::EvaluationsController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def show
    evaluation = Evaluation.find(evaluation_params[:id])
    respond_with evaluation
  end

  def index
    evaluations = Evaluation.all
    respond_with evaluations, :include => [:land, :user]
  end

  def create
    evaluation = Evaluation.new(evaluation_params)
    if evaluation.save
      respond_with evaluation, location: nil
    end
  end

  def update
    evaluation = Evaluation.find(evaluation_params[:id])
    evaluation.update_attributes(evaluation_params)
    respond_with evaluation
  end

  def qualify
    evaluation_id = qualification_params['evaluation_id']
    qualifications = qualification_params['qualifications']
    scores = []
    qualifications.each do | qualification |
      # qualification['variable_id'], evaluation_id, qualification['score']
      variable_score = VariableScore.new()
      variable_score.variable_id = qualification['variable_id']
      variable_score.evaluation_id = evaluation_id
      variable_score.score = qualification['score']
      # variable_score.save()
      scores.push(variable_score)
      # variable_score.save()
      # p qualification['variable_id']
    end
    respond_with scores, location: nil
  end

  def destroy
    respond_with Evaluation.destroy(params[:id])
  end

  private

  def evaluation_params
    params.permit(:id, :land_id, :user_id)
  end

  def qualification_params
    params.permit(:evaluation_id, qualifications: [:variable_id, :score])
  end
    
end