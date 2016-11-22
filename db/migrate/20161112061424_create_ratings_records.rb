class CreateRatingsRecords < ActiveRecord::Migration
  def change
    create_table :ratings_records do |t|
      t.integer :land_id
      t.integer :evaluator_document
      t.float :result
    end
  end
end
