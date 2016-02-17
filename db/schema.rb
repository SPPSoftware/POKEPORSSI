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

ActiveRecord::Schema.define(version: 20160217002418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_goalie_scores", force: :cascade do |t|
    t.integer  "goalie_id"
    t.integer  "saves"
    t.integer  "assists"
    t.integer  "goals"
    t.integer  "game_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "game_player_scores", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "plus"
    t.integer  "minus"
    t.integer  "game_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "game_scores", force: :cascade do |t|
    t.string   "score"
    t.integer  "goalmaker_id"
    t.integer  "assisted"
    t.time     "goaltime"
    t.integer  "game_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "game_number"
    t.string   "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "games_game_player_scores", id: false, force: :cascade do |t|
    t.integer "games_id"
    t.integer "game_player_scores_id"
  end

  add_index "games_game_player_scores", ["game_player_scores_id"], name: "index_games_game_player_scores_on_game_player_scores_id", using: :btree
  add_index "games_game_player_scores", ["games_id"], name: "index_games_game_player_scores_on_games_id", using: :btree

  create_table "games_game_scores", id: false, force: :cascade do |t|
    t.integer "games_id"
    t.integer "game_scores_id"
  end

  add_index "games_game_scores", ["game_scores_id"], name: "index_games_game_scores_on_game_scores_id", using: :btree
  add_index "games_game_scores", ["games_id"], name: "index_games_game_scores_on_games_id", using: :btree

  create_table "goalies", force: :cascade do |t|
    t.string   "name"
    t.integer  "games"
    t.integer  "saves"
    t.integer  "assists"
    t.integer  "wins"
    t.integer  "ties"
    t.integer  "losses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "gplayer_id"
    t.integer  "assisted_id"
    t.integer  "assisted2_id"
    t.integer  "ggoalie_id"
    t.time     "time"
    t.string   "score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "gplayers", force: :cascade do |t|
    t.string   "name"
    t.integer  "plus"
    t.integer  "minus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_associations", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "goalie_id"
    t.integer  "SeasonGoalieScore_id"
    t.integer  "SeasonPlayerScore_id"
    t.integer  "GameGoalieScore_id"
    t.integer  "GamePlayerScore_id"
    t.integer  "GameScore_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "games"
    t.integer  "goals"
    t.integer  "points"
    t.integer  "assists"
    t.integer  "plus"
    t.integer  "minus"
    t.integer  "vom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "season_goalie_scores", force: :cascade do |t|
    t.string   "name"
    t.integer  "games"
    t.integer  "saves"
    t.integer  "assists"
    t.integer  "goals"
    t.integer  "wins"
    t.integer  "ties"
    t.integer  "losses"
    t.integer  "season_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "season_player_scores", force: :cascade do |t|
    t.string   "name"
    t.integer  "games"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "plus"
    t.integer  "minus"
    t.integer  "vom"
    t.integer  "season_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
