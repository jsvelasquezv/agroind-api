class RemoveUsersReferenceToIndicators < ActiveRecord::Migration
  def change
    remove_reference :indicators, :users, index: true
  end
end
