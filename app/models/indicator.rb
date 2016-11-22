class Indicator < ActiveRecord::Base
  has_many :variables
  has_many :evaluations
end
