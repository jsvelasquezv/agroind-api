class AddEvaluatorKeyToEvaluations < ActiveRecord::Migration
  def change
    add_foreign_key :evaluations, :users, column: :evaluator_id, index: true
  end
end
