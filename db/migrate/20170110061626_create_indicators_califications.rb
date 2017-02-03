class CreateIndicatorsCalifications < ActiveRecord::Migration
  def change
    create_table :indicators_califications do |t|
      t.integer :lands_id
      t.integer :users_id
      t.integer :indicators_id
      t.integer :evaluations_id
    end
    add_index :indicators_califications, :lands_id
    add_index :indicators_califications, :users_id
    add_index :indicators_califications, :indicators_id
    add_index :indicators_califications, :evaluations_id
  end
end
