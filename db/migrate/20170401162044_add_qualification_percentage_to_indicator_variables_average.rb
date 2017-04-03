class AddQualificationPercentageToIndicatorVariablesAverage < ActiveRecord::Migration
  def change
    add_column :indicator_variables_averages, :qualification_percentage, :float
  end
end
