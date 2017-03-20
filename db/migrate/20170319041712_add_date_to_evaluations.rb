class AddDateToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :assignment_date, :date
  end
end
