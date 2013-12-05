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

ActiveRecord::Schema.define(version: 20131205034915) do

  create_table "dishes", force: true do |t|
    t.string   "title"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "description"
    t.string   "image"
    t.string   "restaurant"
  end

  create_table "likes", force: true do |t|
    t.integer  "dish_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["dish_id"], name: "index_likes_on_dish_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "payments", force: true do |t|
    t.integer  "amount"
    t.datetime "paid_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subscription_id"
  end

  create_table "subscriptions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.datetime "last_payment_date"
    t.integer  "num_failures"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "password_digest"
    t.boolean  "restaurant_owner"
    t.string   "cc_token"
    t.string   "card_token"
    t.string   "stripe_customer_token"
  end

end
