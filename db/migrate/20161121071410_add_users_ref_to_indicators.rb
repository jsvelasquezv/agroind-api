class AddUsersRefToIndicators < ActiveRecord::Migration
  def change
    add_reference :indicators, :users, index: true, foreign_key: true
  end
end
