class Api::V1::StatisticsController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :json

  def ranking_best
    best = Evaluation.ordered_by_result_desc
    respond_with best, :include => [:land, :user], location: nil
  end

  def ranking_worst
    worst = Evaluation.ordered_by_result_asc
    respond_with worst, :include => [:land, :user], location: nil
  end

  def radar_data_between_dates
    start_date = radar_data_dates_params['start_date'].to_date
    end_date = radar_data_dates_params['end_date'].to_date
    evaluations = Evaluation.where(:assignment_date => start_date..end_date)
    labels = Indicator.all.map { | indicator | indicator.name }
    datasets = []
    evaluations.each do | evaluation |
      dataset = {}
      dataset['label'] = evaluation.assignment_date 
      dataset['data'] = evaluation.indicator_variables_averages.map { | average | average.result }
      datasets.push(dataset)
    end
    data = {labels: labels, datasets: datasets}
    respond_with data, location: nil
  end

  def evaluation_report
    evaluation_id = evaluation_report_params['evaluation_id']
    evaluation = Evaluation.includes(:land).find_by(id: evaluation_id)
    if evaluation != nil
      indicators = Indicator.all
      variables = Variable.all
      indicator_variables_averages = IndicatorVariablesAverage.where(:evaluation_id => evaluation_id)
      indicator_variables_averages_indexed = indicator_variables_averages.group_by { | average | average.indicator_id }
      variable_scores = VariableScore.includes(:variable).where(:evaluation_id => evaluation_id)
      variables_scores_indexed =  variable_scores.group_by { | score | score.indicator_id }
      variables_indexed = variables.group_by { | variable | variable.id}
      # variables_report = []
      # variable_scores.each do | variable_score | 
      #   variables_report.push({variable: variable_score.variable, variable_score: variable_score})
      # end

      evaluation_report = {}
      indicators_report = []
      indicator_report = {}
      indicators.each do | indicator |
        indicator_report["id"] = indicator.id
        indicator_report["name"] = indicator.name
        indicator_report["variables_average"] = indicator_variables_averages_indexed[indicator.id]
        indicator_report["variables_scores"] = variables_scores_indexed[indicator.id]
        indicators_report.push(indicator_report)
        indicator_report = {}
      end
      evaluation_report["land"] = evaluation.land
      evaluation_report["evaluation"] = evaluation
      evaluation_report["variables"] = variables_indexed
      evaluation_report["indicators_report"] = indicators_report

      labels = indicators.map { | indicator |  indicator.name }
      datasets = []
      datasetEvaluation = {}
      datasetEvaluation["label"] = evaluation.land.name
      datasetEvaluation["data"] = indicator_variables_averages.map { | average | average.result }
      dataSetOptimun = {}
      dataSetOptimun["label"] = "Optimo"
      dataSetOptimun["data"] = Array.new(indicators.size, 1);

      datasets = [datasetEvaluation, dataSetOptimun]
      chartData = {labels: labels, datasets: datasets}
      evaluation_report["chartData"] = chartData
      # respond_with variables_report[0], location: nil
      respond_with evaluation_report
    else 
      respond_with [], location: nil
    end
  end

  private

  def evaluation_report_params
    params.permit(:evaluation_id)
  end

  def radar_data_dates_params
    params.permit(:start_date, :end_date)
  end
    
end