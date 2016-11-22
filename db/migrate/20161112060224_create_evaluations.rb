class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :property_id
      t.integer :evaluator_document
      t.float :result
    end
  end
end
