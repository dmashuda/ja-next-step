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

ActiveRecord::Schema.define(version: 20160707224303) do

  create_table "career_field", force: :cascade do |t|
    t.string   "label"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_field_keyword", id: false, force: :cascade do |t|
    t.integer "career_field_id", null: false
    t.integer "keyword_id",      null: false
  end

  create_table "keyword", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keyword_post", id: false, force: :cascade do |t|
    t.integer "post_id",    null: false
    t.integer "keyword_id", null: false
  end

  create_table "keyword_stakeholder", id: false, force: :cascade do |t|
    t.integer "stakeholder_id", null: false
    t.integer "keyword_id",     null: false
  end

  create_table "post", force: :cascade do |t|
    t.string   "subject"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "abstract"
    t.text     "body"
    t.string   "contact_email"
    t.string   "email_subject"
    t.text     "email_body"
    t.boolean  "active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "profile", force: :cascade do |t|
    t.integer  "stakeholder_id"
    t.string   "website_url"
    t.string   "facebook_url"
    t.string   "youtube_url"
    t.string   "twitter_url"
    t.string   "instagram_url"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "stakeholder", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "user", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "stakeholder_id"
  end

  add_index "user", ["email"], name: "index_user_on_email", unique: true
  add_index "user", ["reset_password_token"], name: "index_user_on_reset_password_token", unique: true

  create_table "user_role", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
