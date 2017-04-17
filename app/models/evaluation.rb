class Evaluation < ActiveRecord::Base
  belongs_to :evaluator, class_name: "User", foreign_key: "evaluator_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :land
  has_many :variable_scores
  has_many :indicator_variables_averages
  scope :ordered_by_result_desc, -> { joins(:indicator_variables_averages).order('indicator_variables_averages.result DESC').limit(10) }
  scope :ordered_by_result_asc, -> { joins(:indicator_variables_averages).order('indicator_variables_averages.result ASC').limit(10) }
end