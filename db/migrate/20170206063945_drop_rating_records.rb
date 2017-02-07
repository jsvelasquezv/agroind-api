class DropRatingRecords < ActiveRecord::Migration
  def change
    drop_table :ratings_records
  end
end
