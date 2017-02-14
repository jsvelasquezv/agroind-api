class VariableScore < ActiveRecord::Base
  belongs_to :variable
  belongs_to :evaluation
  belongs_to :indicator
end
