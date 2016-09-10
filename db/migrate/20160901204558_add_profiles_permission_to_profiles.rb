class AddProfilesPermissionToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profiles_permission, :boolean
  end
end
