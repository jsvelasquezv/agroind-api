class RemoveIndicatorRefToVariables < ActiveRecord::Migration
  def change
    remove_reference :variables, :indicator, index: true, foreign_key: true
  end
end
