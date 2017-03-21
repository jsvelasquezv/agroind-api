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
    labels = Indicator.all.map { |indicator| indicator.name }
    datasets = []
    evaluations.each do | evaluation |
      dataset = {}
      dataset['label'] = evaluation.assignment_date 
      dataset['data'] = evaluation.indicator_variables_averages.map { |average| average.result }
      datasets.push(dataset)
    end
    data = {labels: labels, datasets: datasets}
    respond_with data, location: nil
    # respond_with evaluations, location: nil
  end

  private

  def radar_data_dates_params
    params.permit(:start_date, :end_date)
  end
    
end