class CreateIndicatorVariablesAverages < ActiveRecord::Migration
  def change
    create_table :indicator_variables_averages do |t|
      t.integer :evaluation_id
      t.integer :indicator_id
      t.float :result
    end
  end
end
