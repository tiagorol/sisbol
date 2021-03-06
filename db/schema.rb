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

ActiveRecord::Schema.define(version: 20151128135311) do

  create_table "accesses", force: :cascade do |t|
    t.datetime "date",              null: false
    t.integer  "user_id", limit: 4, null: false
  end

  add_index "accesses", ["user_id"], name: "index_accesses_on_user_id", using: :btree

  create_table "championships", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.date     "start",                  null: false
    t.date     "end",                    null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "disputes", force: :cascade do |t|
    t.string   "description",     limit: 60,             null: false
    t.integer  "status",          limit: 4,  default: 0, null: false
    t.integer  "championship_id", limit: 4,              null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "disputes", ["championship_id"], name: "index_disputes_on_championship_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "championship_id", limit: 4
    t.integer  "round_id",        limit: 4
    t.integer  "goals_home_team", limit: 4
    t.integer  "goals_away_team", limit: 4
    t.date     "day_of_match"
    t.integer  "home_team_id",    limit: 4
    t.integer  "away_team_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "matches", ["away_team_id"], name: "index_matches_on_away_team_id", using: :btree
  add_index "matches", ["championship_id"], name: "index_matches_on_championship_id", using: :btree
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id", using: :btree
  add_index "matches", ["round_id"], name: "index_matches_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.string   "name",            limit: 20, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "championship_id", limit: 4,  null: false
  end

  add_index "rounds", ["championship_id"], name: "index_rounds_on_championship_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "description",        limit: 60,  null: false
    t.string   "full_description",   limit: 100, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "crest_file_name",    limit: 255
    t.string   "crest_content_type", limit: 255
    t.integer  "crest_file_size",    limit: 4
    t.datetime "crest_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 30,              null: false
    t.string   "surname",             limit: 30,              null: false
    t.date     "date_of_birth",                               null: false
    t.string   "email",               limit: 50,              null: false
    t.string   "password",            limit: 50,              null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "role",                limit: 4,   default: 0, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "accesses", "users"
  add_foreign_key "disputes", "championships"
  add_foreign_key "matches", "championships"
  add_foreign_key "matches", "rounds"
  add_foreign_key "matches", "teams", column: "away_team_id", name: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id", name: "home_team_id"
  add_foreign_key "rounds", "championships"
end
