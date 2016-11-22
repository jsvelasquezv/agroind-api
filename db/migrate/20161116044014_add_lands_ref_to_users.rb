class AddLandsRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :lands, index: true, foreign_key: true
  end
end
