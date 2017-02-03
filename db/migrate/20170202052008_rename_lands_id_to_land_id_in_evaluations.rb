class RenameLandsIdToLandIdInEvaluations < ActiveRecord::Migration
  def change
    rename_column :evaluations, :lands_id, :land_id
  end
end
