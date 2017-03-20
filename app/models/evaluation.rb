class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :land
  has_many :variable_scores
end