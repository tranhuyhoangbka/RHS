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

ActiveRecord::Schema.define(version: 20150708053246) do

  create_table "addresses", force: :cascade do |t|
    t.float    "lon"
    t.float    "lat"
    t.integer  "capacity"
    t.string   "contact"
    t.string   "description"
    t.integer  "type"
    t.string   "address"
    t.float    "rate"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.float    "point"
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["address_id"], name: "index_reviews_on_address_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "rooms", force: :cascade do |t|
    t.float    "square"
    t.boolean  "parking"
    t.integer  "facility"
    t.float    "price"
    t.string   "image"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["address_id"], name: "index_rooms_on_address_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.integer  "age"
    t.string   "job"
    t.string   "address"
    t.string   "phone_number"
    t.string   "provider"
    t.string   "uid"
    t.integer  "role"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
