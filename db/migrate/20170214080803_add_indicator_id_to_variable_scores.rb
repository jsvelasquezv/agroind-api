class AddIndicatorIdToVariableScores < ActiveRecord::Migration
  def change
    add_column :variable_scores, :indicator_id, :integer
    add_index :variable_scores, :indicator_id
  end
end
