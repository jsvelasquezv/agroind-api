class AddUsersRefToEvaluations < ActiveRecord::Migration
  def change
    add_reference :evaluations, :users, index: true, foreign_key: true
  end
end
