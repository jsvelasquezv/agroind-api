class AddIndexesToIndicatorVariablesAverages < ActiveRecord::Migration
  def change
    add_index :indicator_variables_averages, :evaluation_id
    add_index :indicator_variables_averages, :indicator_id
  end
end
