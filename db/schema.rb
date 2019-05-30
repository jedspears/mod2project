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

ActiveRecord::Schema.define(version: 2019_05_29_163834) do

  create_table "bet_requests", force: :cascade do |t|
    t.text "sender"
    t.text "recipient"
    t.integer "amount"
    t.text "description"
    t.boolean "accept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bets", force: :cascade do |t|
    t.text "description"
    t.string "username1"
    t.string "username2"
    t.integer "amount"
    t.string "status"
    t.string "winner1"
    
    t.string "winner2"
    t.string "real_winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holding_accounts", force: :cascade do |t|
    t.integer "balance"
    t.integer "bet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bet_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bet_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "username"
    t.string "password_digest"
    t.text "email"
    t.integer "account_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
