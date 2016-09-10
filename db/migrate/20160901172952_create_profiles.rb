class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.boolean :users
      t.boolean :indicators
      t.boolean :reports, default: true
      t.boolean :statistics
    end
  end
end
