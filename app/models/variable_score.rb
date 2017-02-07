class VariableScore < ActiveRecord::Base
  belongs_to :variable
  belongs_to :evaluation
end
