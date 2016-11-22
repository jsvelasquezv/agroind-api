class AddIndicatorsRefToVariables < ActiveRecord::Migration
  def change
    add_reference :variables, :indicators, index: true, foreign_key: true
  end
end
