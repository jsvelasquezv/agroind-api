class RemoveDefaultValueForReportsPermissionInProfiles < ActiveRecord::Migration
  def change
    change_column_default :profiles, :reports_permission, nil
  end
end
