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

ActiveRecord::Schema.define(version: 20160222122024) do

  create_table "currencies", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "vendor"
    t.float    "amount"
    t.text     "description"
    t.text     "tag"
    t.date     "expensedate"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "expensestatus_id"
    t.integer  "expensetype_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "currency_id"
    t.string   "billnumber"
    t.boolean  "isbillable"
  end

  add_index "expenses", ["currency_id"], name: "index_expenses_on_currency_id"
  add_index "expenses", ["expensestatus_id"], name: "index_expenses_on_expensestatus_id"
  add_index "expenses", ["expensetype_id"], name: "index_expenses_on_expensetype_id"
  add_index "expenses", ["project_id"], name: "index_expenses_on_project_id"
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id"

  create_table "expensestatuses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "expensetypes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.boolean  "isBillable"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "role"
    t.string   "email"
    t.string   "profileurl"
  end

end
