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
    evaluations_size = evaluations.size
    color_codes = ColorCode.all
    labels = Indicator.all.map { | indicator | indicator.name }
    datasets = []
    summary = []
    evaluations.each do | evaluation |
      dataset = {}
      dataset['label'] = evaluation.assignment_date 
      dataset['data'] = evaluation.indicator_variables_averages.map { | average | average.result * 5 }
      datasets.push(dataset)
    end
    indicator_variables_averages = datasets.map { |dataset| dataset['data'] }
    transposed = Array.new(indicator_variables_averages.map(&:length).max){|i| indicator_variables_averages.map{|e| e[i]}}
    sums = transposed.map { |x| x.sum(&:to_f) }
    labels.each_with_index do | label, index |
      value = 0
      if sums[index] != nil
        value = sums[index] / evaluations_size
      end
      color = 
      average = {indicator: label, value: value, color: getColorSummary(color_codes, value)}
      summary.push(average)
      average = nil
    end
    data = {labels: labels, datasets: datasets, summary: summary}
    respond_with data, location: nil
  end

  def evaluation_report
    evaluation_id = evaluation_report_params['evaluation_id']
    evaluation = Evaluation.includes(:land).find_by(id: evaluation_id)
    color_codes = ColorCode.all
    if evaluation != nil
      indicators = Indicator.all
      variables = Variable.all
      indicator_variables_averages = IndicatorVariablesAverage.where(:evaluation_id => evaluation_id)
      indicator_variables_averages_indexed = indicator_variables_averages.group_by { | average | average.indicator_id }
      variable_scores = VariableScore.includes(:variable).where(:evaluation_id => evaluation_id)
      variables_scores_indexed =  variable_scores.group_by { | score | score.indicator_id }
      variables_indexed = variables.group_by { | variable | variable.id}
      # p indicator_variables_averages_indexed
      evaluation_report = {}
      indicators_report = []
      indicator_report = {}
      indicators.each do | indicator |
        indicator_report["id"] = indicator.id
        indicator_report["name"] = indicator.name
        indicator_report["variables_average"] = indicator_variables_averages_indexed[indicator.id]
        indicator_report["color"] = getColor(color_codes, indicator_report["variables_average"])
        # p indicator_variables_averages_indexed[indicator.id]
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
      datasetEvaluation["data"] = indicator_variables_averages.map { | average | average.result * 5}
      dataSetOptimun = {}
      dataSetOptimun["label"] = "Optimo"
      dataSetOptimun["data"] = Array.new(indicators.size, 5);

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

  def getColor(color_codes, variables_average)
    color = nil
    if variables_average != nil
      value = variables_average[0]['result'] * 5
      if (value >= color_codes[0].min && value < color_codes[1].min)
        color = color_codes[0].color
      elsif (value >= color_codes[1].min && value < color_codes[2].min)
        color = color_codes[1].color
      elsif (value >= color_codes[2].min && value < color_codes[3].min)
        color = color_codes[2].color
      elsif (value >= color_codes[3].min && value < color_codes[4].min)
        color = color_codes[3].color
      elsif (value >= color_codes[4].min && value <= color_codes[4].max)
        color = color_codes[4].color
      end
    end
    return color
  end

  def getColorSummary(color_codes, value)
    color = nil
    if (value >= color_codes[0].min && value < color_codes[1].min)
      color = color_codes[0].color
    elsif (value >= color_codes[1].min && value < color_codes[2].min)
      color = color_codes[1].color
    elsif (value >= color_codes[2].min && value < color_codes[3].min)
      color = color_codes[2].color
    elsif (value >= color_codes[3].min && value < color_codes[4].min)
      color = color_codes[3].color
    elsif (value >= color_codes[4].min && value <= color_codes[4].max)
      color = color_codes[4].color
    end
    return color
  end
    
end