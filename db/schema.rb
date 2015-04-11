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

ActiveRecord::Schema.define(version: 20150410184235) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "house_number", null: false
    t.string   "street",       null: false
    t.string   "apt_number"
    t.string   "city",         null: false
    t.string   "county"
    t.integer  "state",        null: false
    t.integer  "country"
    t.string   "zip"
    t.string   "zip_ext"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "administrators", force: :cascade do |t|
    t.integer  "member_id"
    t.text     "description"
    t.integer  "permissions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bible_lesson_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bible_lessons", force: :cascade do |t|
    t.string   "title"
    t.string   "subject"
    t.integer  "category_id"
    t.integer  "author_id"
    t.text     "tags"
    t.text     "lesson"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "name",            null: false
    t.text     "description"
    t.string   "link"
    t.integer  "organization_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "departments", ["name"], name: "index_departments_on_name", unique: true

  create_table "developers", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.integer  "permissions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "maintainers", force: :cascade do |t|
    t.integer  "member_id"
    t.text     "description"
    t.integer  "permissions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "person_id",   null: false
    t.date     "since"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "permissions"
  end

  add_index "members", ["person_id"], name: "index_members_on_person_id", unique: true

  create_table "news_article_user_tags", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.string   "subject"
    t.integer  "category_id"
    t.integer  "author_id"
    t.date     "date"
    t.text     "tags"
    t.text     "article"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "news_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "head_id"
    t.integer  "assistant_id"
    t.integer  "members_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "organizations", ["name"], name: "index_organizations_on_name", unique: true

  create_table "parties", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "parties", ["name"], name: "index_parties_on_name", unique: true

  create_table "party_memberships", force: :cascade do |t|
    t.integer  "party_id",   null: false
    t.integer  "person_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "party_memberships", ["party_id", "person_id"], name: "index_party_memberships_on_party_id_and_person_id", unique: true

  create_table "persons", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "party_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.text     "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true

  create_table "relationships", force: :cascade do |t|
    t.integer  "type",       null: false
    t.integer  "source_id",  null: false
    t.integer  "dest_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "relationships", ["source_id", "dest_id"], name: "index_relationships_on_source_id_and_dest_id", unique: true

  create_table "role_assignments", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "member_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_assignments", ["role_id", "member_id"], name: "index_role_assignments_on_role_id_and_member_id", unique: true

  create_table "roles", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true

  create_table "suffixes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "person_id",     null: false
    t.string   "unom",          null: false
    t.string   "email",         null: false
    t.string   "salt"
    t.integer  "name_t"
    t.string   "name_f",        null: false
    t.string   "name_m"
    t.string   "name_l",        null: false
    t.integer  "name_s"
    t.integer  "status",        null: false
    t.integer  "contact_id"
    t.date     "birthdate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "permissions"
    t.string   "salt_passhash"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name_t", "name_f", "name_m", "name_l", "name_s"], name: "fullname", unique: true
  add_index "users", ["unom"], name: "index_users_on_unom", unique: true

end
