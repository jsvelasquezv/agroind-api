class Api::V1::EvaluationsController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def show
    evaluation = Evaluation.find(evaluation_params[:id])
    respond_with evaluation
  end

  def index
    evaluations = Evaluation.all
    respond_with evaluations, :include => [:land, :user, :evaluator]
    # respond_with '', location: nil
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
      updated_evaluation = Evaluation.where(evaluation_id: evaluation['id'])
      updated_evaluation.update_all(evaluation)
      updated_evaluations.push(updated_evaluation)
    end
    respond_with updated_evaluations, location: nil
  end

  def qualify
    evaluation_id = qualification_params['evaluation_id']
    indicator_id = qualification_params['indicator_id']
    qualifications = qualification_params['qualifications']
    evaluation = Evaluation.find(evaluation_id)
    indicator = Indicator.find(indicator_id);
    scores = []
    variable_average = 0
    qualification_percentage = 0
    qualifications.each do | qualification |
      # qualification['variable_id'], evaluation_id, qualification['score']
      variable_id = qualification['variable_id']
      score = qualification['score']
      variable_score = VariableScore.find_by(evaluation_id: evaluation_id, indicator_id: indicator_id, variable_id: variable_id)
      if variable_score == nil
        variable_score = VariableScore.new()
        variable_score.evaluation_id = evaluation_id
        variable_score.indicator_id = indicator_id
        variable_score.variable_id = variable_id
      end
      variable_score.score = score
      variable_score.save()
      variable_average += score
      scores.push(variable_score)
    end
    if scores.size == 0 
      variable_average = 0 
      qualification_percentage = 0 
    else 
      variable_average = variable_average / scores.size
      qualification_percentage = 100 * scores.size / indicator.variables.size
    end
    indicator_variables_average = IndicatorVariablesAverage.find_by(evaluation_id: evaluation_id, indicator_id: indicator_id)
    if indicator_variables_average == nil
      indicator_variables_average = IndicatorVariablesAverage.new()
      indicator_variables_average.evaluation_id = evaluation_id
      indicator_variables_average.indicator_id = indicator_id
    end
    indicator_variables_average.result = variable_average
    indicator_variables_average.qualification_percentage = qualification_percentage
    indicator_variables_average.save()
    evaluation.result = evaluation.variable_scores.average(:score)
    evaluation.save()
    respond_with scores, location: nil
  end

  def batch_qualify
    qualificationsToApi = []
    params['_json'].each do | qualification |
      evaluation_id = qualification['evaluation_id']
      indicator_id = qualification['indicator_id']
      qualification['qualifications'].each do | score |
        variable_id = score['variable_id']
          # variable_score = VariableScore.find(
          #   evaluation_id: evaluation_id,
          #   indicator_id: indicator_id,
          #   variable_id: variable_id
          # ) rescue nil
          # if variable_score == nil
            variable_score = VariableScore.new()
            variable_score.evaluation_id = evaluation_id
            variable_score.indicator_id = indicator_id
            variable_score.variable_id = variable_id
            variable_score.save()
          # else
          #   variable_score.evaluation_id = evaluation_id
          #   variable_score.indicator_id = indicator_id
          #   variable_score.variable_id = variable_id
          #   variable_score.save()
          # end
          qualificationsToApi.push(variable_score)
      end
    end
    respond_with qualificationsToApi, location: nil
  end

  def qualifications
    evaluation_id = qualification_params['evaluation_id']
    indicator_id = qualification_params['indicator_id']
    scores = VariableScore.where(evaluation_id: evaluation_id, indicator_id: indicator_id)
    respond_with scores, location: nil
  end

  def indicator_variables_averages
    evaluation_id = params[:evaluation_id]
    indicator_variables_averages = IndicatorVariablesAverage.where(evaluation_id: evaluation_id)
    indicator_variables_averages_indexed = indicator_variables_averages.group_by { | average | average.indicator_id }
    respond_with indicator_variables_averages_indexed, location: nil
  end

  def destroy
    respond_with Evaluation.destroy(params[:id])
  end

  def add_recommendation
    evaluation = Evaluation.find(recommendation_params['id'])
    evaluation.recommendations = recommendation_params['recommendations']
    evaluation.save
    respond_with evaluation, location: nil
  end

  def add_analysis
    evaluation = Evaluation.find(analysis_params['id'])
    evaluation.analysis = analysis_params['analysis']
    evaluation.save
    respond_with evaluation, location: nil
  end

  private

  def recommendation_params
    params.permit(:id, :recommendations)
  end

  def analysis_params
    params.permit(:id, :analysis)
  end

  def evaluation_params
    params.permit(:id, :land_id, :user_id, :evaluator_id, :assignment_date, :result, :recommendation, :analysis)
  end

  def batch_evaluation_params
    params.permit(evaluations: [:id, :land_id, :user_id, :evaluator_id])
  end

  def qualification_params
    params.permit(:evaluation_id, :indicator_id, qualifications: [:variable_id, :score])
  end

  def batch_qualification_params
    params.permit(_json: [:evaluation_id, :indicator_id, qualifications: [:variable_id, :score]])
  end
    
end