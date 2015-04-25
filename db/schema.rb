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

ActiveRecord::Schema.define(version: 20150425131848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationals", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "type_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "third_name"
    t.integer  "gender_id"
    t.string   "special_rights"
    t.string   "сп_возврата"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
