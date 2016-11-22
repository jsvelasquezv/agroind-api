class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.integer :propietary_document
      t.string :name
      t.string :zone
      t.string :municipality
      t.float :asnm
      t.float :latitude
      t.float :longitude
      t.float :area
      t.string :affiliation
    end
  end
end
