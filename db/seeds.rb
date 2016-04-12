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
              summoner_name:         "javaspparow",
              champion_role:         0,
              password:              "urgod_shimane",
              password_confirmation: "urgod_shimane")
            .roles.create id: 1, name:"admin"

Achievement.create!(achievement_type:        :triple_kill_aram,
					name:        "トリプルキル",
					description: "ARAMでトリプルキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "トリプルキル",
					gametype: :aram)

Achievement.create!(achievement_type:        :double_kill_aram,
					name:        "ダブルキル",
					description: "ARAMでダブルキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "ダブルキル",
					gametype: :aram)

Achievement.create!(achievement_type:        :quadra_kill_aram,
					name:        "クアドラキル",
					description: "ARAMでクアドラキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "クアドラキル",
					gametype: :aram)

Achievement.create!(achievement_type:        :penta_kill_aram,
					name:        "ペンタキル",
					description: "ARAMでペンタキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "ペンタキル",
					gametype: :aram)