class RenameEvaluatorDocumentToUserIdInEvaluations < ActiveRecord::Migration
  def change
    rename_column :evaluations, :evaluator_document, :user_id
    add_index :evaluations, :user_id
  end
end
