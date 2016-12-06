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

ActiveRecord::Schema.define(version: 20161206052231) do

  create_table "evaluations", force: :cascade do |t|
    t.integer "evaluator_document"
    t.float   "result"
    t.integer "users_id"
    t.integer "lands_id"
  end

  add_index "evaluations", ["lands_id"], name: "index_evaluations_on_lands_id"
  add_index "evaluations", ["users_id"], name: "index_evaluations_on_users_id"

  create_table "indicators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lands_id"
  end

  add_index "indicators", ["lands_id"], name: "index_indicators_on_lands_id"

  create_table "lands", force: :cascade do |t|
    t.string  "name"
    t.string  "zone"
    t.string  "municipality"
    t.float   "asnm"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "area"
    t.string  "affiliation"
    t.integer "users_id"
  end

  add_index "lands", ["users_id"], name: "index_lands_on_users_id"

  create_table "profiles", force: :cascade do |t|
    t.string  "name"
    t.boolean "users_permission"
    t.boolean "indicators_permission"
    t.boolean "reports_permission"
    t.boolean "statistics_permission"
    t.boolean "profiles_permission"
    t.boolean "create_users"
    t.boolean "list_users"
    t.boolean "edit_users"
    t.boolean "deactivate_users"
    t.boolean "create_profiles"
    t.boolean "list_profiles"
    t.boolean "edit_profiles"
    t.boolean "clone_profiles"
  end

  create_table "ratings_records", force: :cascade do |t|
    t.integer "land_id"
    t.integer "evaluator_document"
    t.float   "result"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
    t.boolean  "state"
    t.integer  "document"
    t.string   "last_name"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["profile_id"], name: "index_users_on_profile_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

  create_table "variables", force: :cascade do |t|
    t.string   "name"
    t.decimal  "optimun_rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "indicators_id"
  end

  add_index "variables", ["indicators_id"], name: "index_variables_on_indicators_id"

end
