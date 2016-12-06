class RemoveLandsReferenceToUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :lands, index: true
  end
end
