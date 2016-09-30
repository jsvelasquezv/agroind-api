class AddDocumentLastNameAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :document, :integer
    add_column :users, :last_name, :string
    add_column :users, :address, :string
  end
end
