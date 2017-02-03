class RenameIndicatorsIdToIndicatorIdInVarialbes < ActiveRecord::Migration
  def change
    rename_column :variables, :indicators_id, :indicator_id
  end
end
