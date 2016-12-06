class AddUsersRefToLands < ActiveRecord::Migration
  def change
    add_reference :lands, :users, index: true, foreign_key: true
  end
end
