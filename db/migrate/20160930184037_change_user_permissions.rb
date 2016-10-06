class ChangeUserPermissions < ActiveRecord::Migration
  def change
    add_column :profiles, :create_users, :boolean
    add_column :profiles, :list_users, :boolean
    add_column :profiles, :edit_users, :boolean
    add_column :profiles, :deactivate_users, :boolean

    add_column :profiles, :create_profiles, :boolean
    add_column :profiles, :list_profiles, :boolean
    add_column :profiles, :edit_profiles, :boolean
    add_column :profiles, :clone_profiles, :boolean
  end
end
