class AddIndicatorToVariables < ActiveRecord::Migration
  def change
    add_reference :variables, :indicator, index: true, foreign_key: true
  end
end
