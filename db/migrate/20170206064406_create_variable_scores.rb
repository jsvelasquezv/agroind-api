class CreateVariableScores < ActiveRecord::Migration
  def change
    create_table :variable_scores do |t|
      t.integer :variable_id
      t.integer :evaluation_id
      t.decimal :score
    end
  end
end
