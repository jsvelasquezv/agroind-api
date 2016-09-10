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
                               profiles_permission: true)

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