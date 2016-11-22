class AddLandsRefToEvaluations < ActiveRecord::Migration
  def change
    add_reference :evaluations, :lands, index: true, foreign_key: true
  end
end
