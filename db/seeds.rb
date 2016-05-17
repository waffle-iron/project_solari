# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#insert admin user
#Role.create!  name: "admin"
admin_user = User.create!( user_name:             "admin",
              email:                 "admin@example.com",
              summoner_name:         "javaspparow",
              champion_role:         0,
              password:              "urgod_shimane",
              password_confirmation: "urgod_shimane",
              play_weekday_night:    true,
              play_weekday_latenight: true,
              play_holyday_noon: true)
admin_user.roles.create id: 1, name:"admin"

User.create!( user_name:             "user1",
              email:                 "user1@example.com",
              summoner_name:         "marpore",
              champion_role:         0,
              password:              "urgod_shimane",
              password_confirmation: "urgod_shimane",
              play_weekday_night:    true,
              play_weekday_latenight: true,
              play_holyday_noon: true)

User.create!( user_name:             "user2",
              email:                 "user2@example.com",
              summoner_name:         "ddukyu",
              champion_role:         0,
              password:              "urgod_shimane",
              password_confirmation: "urgod_shimane",
              play_weekday_night:    true,
              play_weekday_latenight: true,
              play_holyday_noon: true)

Achievement.create!(achievement_type:        :triple_kill_aram,
					name:        "ARAMトリプルキル",
					description: "ARAMでトリプルキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "トリプルキル",
					gametype: :aram)

Achievement.create!(achievement_type:        :double_kill_aram,
					name:        "ARAMダブルキル",
					description: "ARAMでダブルキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "ダブルキル",
					gametype: :aram)

Achievement.create!(achievement_type:        :quadra_kill_aram,
					name:        "ARAMクアドラキル",
					description: "ARAMでクアドラキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "クアドラキル",
					gametype: :aram)

Achievement.create!(achievement_type:        :penta_kill_aram,
					name:        "ARAMペンタキル",
					description: "ARAMでペンタキルを達成しよう！",
					image:       "achievements/yi.gif",
					image_locked:       "achievements/yi_locked.gif",
					count:        0,
					difficulty:  :easy,
					requirement: "ペンタキル",
					gametype: :aram)

Achievement.create!(achievement_type:        :double_kill_ranked,
          name:        "ダブルキル",
          description: "ランクでダブルキルを達成しよう！",
          image:       "achievements/yi.gif",
          image_locked:       "achievements/yi_locked.gif",
          count:        0,
          difficulty:  :easy,
          requirement: "ダブルキル",
          gametype: :ranked)
