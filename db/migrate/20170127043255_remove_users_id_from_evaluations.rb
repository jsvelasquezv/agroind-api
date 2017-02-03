class RemoveUsersIdFromEvaluations < ActiveRecord::Migration
  def change
    remove_column :evaluations, :users_id
  end
end
