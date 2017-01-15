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

ActiveRecord::Schema.define(version: 20170115025946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.text     "meta_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "lead"
    t.string   "image_link"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "makers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regularities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.boolean  "open"
    t.boolean  "mid"
    t.boolean  "close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "email"
    t.string   "job_title"
    t.boolean  "manager"
    t.integer  "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "regularity_id"
    t.integer  "schedule_id"
    t.boolean  "opening"
    t.boolean  "middle"
    t.boolean  "closing"
    t.boolean  "starting"
    t.boolean  "midday"
    t.boolean  "ending"
    t.boolean  "archived",      default: false
  end

  create_table "ticks", force: :cascade do |t|
    t.boolean  "complete"
    t.float    "temperature"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "staff_id"
    t.boolean  "active",        default: true
    t.string   "stage"
    t.integer  "regularity_id"
    t.datetime "date"
    t.integer  "edited"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "subscribed"
    t.string   "stripe_id"
    t.integer  "plan"
    t.string   "organisation"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
