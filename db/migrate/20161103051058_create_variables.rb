class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :name
      t.decimal :optimun_rating

      t.timestamps null: false
    end
  end
end
