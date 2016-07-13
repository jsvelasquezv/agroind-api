class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string, null: false, default: "propietario"
  end
end
