class AddLandsRefToIndicators < ActiveRecord::Migration
  def change
    add_reference :indicators, :lands, index: true, foreign_key: true
  end
end
