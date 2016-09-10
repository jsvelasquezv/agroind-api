class RenameUsersToUsersPermissionOnProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :users, :users_permission
    rename_column :profiles, :indicators, :indicators_permission
    rename_column :profiles, :reports, :reports_permission
    rename_column :profiles, :statistics, :statistics_permission
  end
end
