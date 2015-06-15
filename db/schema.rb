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

ActiveRecord::Schema.define(version: 20150602102246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chairs", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educationforms", force: :cascade do |t|
    t.integer  "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.boolean  "original"
    t.string   "series"
    t.string   "number"
    t.date     "where"
    t.string   "university"
    t.integer  "etype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etypes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financingforms", force: :cascade do |t|
    t.boolean  "budget"
    t.boolean  "paid"
    t.boolean  "paid_budg"
    t.integer  "educationform_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string   "gender_title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "identifies", force: :cascade do |t|
    t.boolean  "original"
    t.integer  "type_id"
    t.string   "country"
    t.string   "series"
    t.string   "number"
    t.string   "unit"
    t.date     "where"
    t.string   "issued_by"
    t.date     "birthday"
    t.string   "birth_place"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "nationals", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personaldocs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "third_name"
    t.integer  "gender_id"
    t.string   "special_rights"
    t.string   "сп_возврата"
    t.string   "phone_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "title"
    t.integer  "chair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "type_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unifiedexams", force: :cascade do |t|
    t.boolean  "original"
    t.string   "year"
    t.string   "number"
    t.string   "russian"
    t.string   "math"
    t.string   "social_science"
    t.string   "physics"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.integer  "identify_id"
    t.integer  "personaldoc_id"
    t.integer  "education_id"
    t.integer  "unifiedexam_id"
    t.integer  "educationform_id"
    t.integer  "specialization_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
