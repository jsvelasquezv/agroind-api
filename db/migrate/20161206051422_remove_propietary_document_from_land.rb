class RemovePropietaryDocumentFromLand < ActiveRecord::Migration
  def change
    remove_column :lands, :propietary_document
  end
end
