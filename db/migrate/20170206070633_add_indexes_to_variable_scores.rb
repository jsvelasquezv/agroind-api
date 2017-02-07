class AddIndexesToVariableScores < ActiveRecord::Migration
  def change
    add_index :variable_scores, :variable_id
    add_index :variable_scores, :evaluation_id
  end
end
