class AddAnalysisAndRecommendationsToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :analysis, :text
    add_column :evaluations, :recommendations, :text
  end
end
