class RemovePropertyIdFromEvaluations < ActiveRecord::Migration
  def change
    remove_column :evaluations, :property_id
  end
end
