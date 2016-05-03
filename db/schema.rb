# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160503073436) do

  create_table "achievement_users", force: :cascade do |t|
    t.integer  "achievement_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "achievement_users_games", force: :cascade do |t|
    t.integer "achievement_user_id", limit: 4
    t.integer "game_id",             limit: 4
  end

  add_index "achievement_users_games", ["achievement_user_id"], name: "index_achievement_users_games_on_achievement_user_id", using: :btree
  add_index "achievement_users_games", ["game_id"], name: "index_achievement_users_games_on_game_id", using: :btree

  create_table "achievements", force: :cascade do |t|
    t.integer  "achievement_type", limit: 4
    t.string   "name",             limit: 255
    t.string   "description",      limit: 255
    t.string   "image",            limit: 255
    t.integer  "count",            limit: 4
    t.integer  "difficulty",       limit: 4
    t.string   "requirement",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "gametype",         limit: 4
    t.string   "image_locked",     limit: 255
  end

  create_table "achievements_users", id: false, force: :cascade do |t|
    t.integer "user_id",        limit: 4, null: false
    t.integer "achievement_id", limit: 4, null: false
  end

  add_index "achievements_users", ["achievement_id"], name: "index_achievements_users_on_achievement_id", using: :btree
  add_index "achievements_users", ["user_id"], name: "index_achievements_users_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "game_id",     limit: 4
    t.integer  "champion_id", limit: 4
    t.datetime "create_date"
    t.integer  "game_mode",   limit: 4
    t.integer  "spell_1",     limit: 4
    t.integer  "spell_2",     limit: 4
    t.integer  "item1",       limit: 4
    t.integer  "item2",       limit: 4
    t.integer  "item3",       limit: 4
    t.integer  "item4",       limit: 4
    t.integer  "item5",       limit: 4
    t.integer  "item6",       limit: 4
    t.integer  "time_played", limit: 4
    t.integer  "death",       limit: 4
    t.integer  "kill",        limit: 4
    t.integer  "assist",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "item0",       limit: 4
    t.boolean  "win"
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "game_id", limit: 4
    t.integer "user_id", limit: 4
  end

  add_index "games_users", ["game_id"], name: "index_games_users_on_game_id", using: :btree
  add_index "games_users", ["user_id"], name: "index_games_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
    t.integer "role_id", limit: 4, null: false
  end

  create_table "teamchats", force: :cascade do |t|
    t.integer  "team_id",    limit: 4,     null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.text     "body",       limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teamonlychats", force: :cascade do |t|
    t.integer  "team_id",    limit: 4,     null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.text     "body",       limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "teamchats_count",     limit: 4,   default: 0
    t.integer  "teamonlychats_count", limit: 4,   default: 0
  end

  create_table "teams_users", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "team_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "user_name",              limit: 255
    t.string   "summoner_name",          limit: 255
    t.integer  "champion_role",          limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_achievements", id: false, force: :cascade do |t|
    t.integer "user_id",        limit: 4, null: false
    t.integer "achievement_id", limit: 4, null: false
  end

  add_index "users_achievements", ["achievement_id"], name: "index_users_achievements_on_achievement_id", using: :btree
  add_index "users_achievements", ["user_id"], name: "index_users_achievements_on_user_id", using: :btree

  create_table "users_teams", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "team_id", limit: 4
  end

  add_foreign_key "achievement_users_games", "achievement_users"
  add_foreign_key "achievement_users_games", "games"
  add_foreign_key "games_users", "games"
  add_foreign_key "games_users", "users"
end
