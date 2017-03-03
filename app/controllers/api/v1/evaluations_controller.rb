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

  def batch_create
    evaluations = batch_evaluation_params['evaluations']
    created_evaluations = []
    evaluations.each do | evaluation |
      temp_evaluation = Evaluation.new(evaluation)
      temp_evaluation.save()
      created_evaluations.push(temp_evaluation)
    end
    respond_with created_evaluations, location: nil
  end

  def update
    evaluation = Evaluation.find(evaluation_params[:id])
    evaluation.update_attributes(evaluation_params)
    respond_with evaluation
  end

  def batch_update
    evaluations = batch_evaluation_params['evaluations']
    updated_evaluations = []
    evaluations.each do | evaluation |
      updated_evaluation = Evaluation.find(evaluation['id'])
      updated_evaluation.update_attributes(evaluation)
      updated_evaluations.push(updated_evaluation)
    end
    respond_with updated_evaluations, location: nil
  end

  def qualify
    evaluation_id = qualification_params['evaluation_id']
    indicator_id = qualification_params['indicator_id']
    qualifications = qualification_params['qualifications']
    scores = []
    qualifications.each do | qualification |
      # qualification['variable_id'], evaluation_id, qualification['score']
      variable_score = VariableScore.new()
      variable_score.variable_id = qualification['variable_id']
      variable_score.evaluation_id = evaluation_id
      variable_score.score = qualification['score']
      variable_score.indicator_id = indicator_id
      variable_score.save()
      scores.push(variable_score)
    end
    respond_with scores, location: nil
  end

  def qualifications
    evaluation_id = qualification_params['evaluation_id']
    indicator_id = qualification_params['indicator_id']
    scores = VariableScore.where(evaluation_id: evaluation_id, indicator_id: indicator_id)
    respond_with scores, location: nil
  end

  def destroy
    respond_with Evaluation.destroy(params[:id])
  end

  private

  def evaluation_params
    params.permit(:id, :land_id, :user_id)
  end

  def batch_evaluation_params
    params.permit(evaluations: [:id, :land_id, :user_id])
  end

  def qualification_params
    params.permit(:evaluation_id, :indicator_id, qualifications: [:variable_id, :score])
  end
    
end