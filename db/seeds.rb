# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_profile = Profile.create(name: 'admin',
                               users_permission: true,
                               indicators_permission: true,
                               reports_permission: true,
                               statistics_permission: true,
                               profiles_permission: true,
                               create_users: true,
                               list_users: true,
                               edit_users: true,
                               deactivate_users: true,
                               create_profiles: true,
                               list_profiles: true,
                               edit_profiles: true,
                               clone_profiles: true
                               )

owner = Profile.create(name: 'owner',
                       users_permission: false,
                       indicators_permission: false,
                       reports_permission: true,
                       statistics_permission: false,
                       profiles_permission: false)

typist = Profile.create(name: 'typist',
                        users_permission: false,
                        indicators_permission: true,
                        reports_permission: true,
                        statistics_permission: false,
                        profiles_permission: false)

evaluator = Profile.create(name: 'evaluator',
                           users_permission: false,
                           indicators_permission: true,
                           reports_permission: true,
                           statistics_permission: false,
                           profiles_permission: false)

admin_user = User.create(name: 'Juan',
                         email: 'juseve200@gmail.com',
                         profile_id: 1,
                         password: '12341234',
                         password_confirmation: '12341234',
                         last_name: 'velasquez',
                         document: 1116264525,
                         address: 'Cra 10 #5-03')