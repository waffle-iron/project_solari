# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#insert admin user
#Role.create!  name: "admin"
User.create!( user_name:             "admin",
              email:                 "admin@example.com",
              password:              "urgod_shimane",
              password_confirmation: "urgod_shimane")
            .roles.create id: 1, name:"admin"