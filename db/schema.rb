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

ActiveRecord::Schema.define(version: 20150404021641) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "house_number"
    t.string   "street"
    t.string   "apt_number"
    t.string   "city"
    t.string   "county"
    t.integer  "state"
    t.integer  "country"
    t.string   "zip"
    t.string   "zip_ext"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "home_address_id"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "fax"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "since"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.integer  "head_id"
    t.integer  "assistant_id"
    t.integer  "members_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "party_memberships", force: :cascade do |t|
    t.integer  "party_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "type"
    t.integer  "source_id"
    t.integer  "dest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_assignments", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "unom"
    t.string   "email"
    t.string   "passhash"
    t.string   "salt"
    t.integer  "name_t"
    t.string   "name_f"
    t.string   "name_m"
    t.string   "name_l"
    t.integer  "name_s"
    t.integer  "status"
    t.integer  "contact_id"
    t.date     "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end