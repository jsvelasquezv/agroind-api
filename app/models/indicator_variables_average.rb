class IndicatorVariablesAverage < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :indicator
end
