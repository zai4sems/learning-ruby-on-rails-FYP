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

ActiveRecord::Schema.define(version: 20161125035228) do

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.decimal  "purchase_price"
    t.float    "volume"
    t.string   "unit"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string   "material_name"
    t.decimal  "purchase_price"
    t.float    "purchase_quantity"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "overheads", force: :cascade do |t|
    t.string   "title"
    t.decimal  "month_1"
    t.decimal  "month_2"
    t.decimal  "month_3"
    t.decimal  "month_4"
    t.decimal  "month_5"
    t.decimal  "month_6"
    t.decimal  "month_7"
    t.decimal  "month_8"
    t.decimal  "month_9"
    t.decimal  "month_10"
    t.decimal  "month_11"
    t.decimal  "month_12"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "quantity"
    t.decimal  "cost"
  end

  add_index "recipe_ingredients", ["recipe_id", "ingredient_id"], name: "index_recipe_ingredients_on_recipe_id_and_ingredient_id", unique: true

  create_table "recipe_materials", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "quantity"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "instructions"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "need"
    t.decimal  "rate_per_hour"
    t.float    "time_spent_in_hour"
    t.integer  "percentage_profit"
    t.integer  "serving_number"
    t.string   "image"
    t.integer  "user_id"
    t.decimal  "material_cost"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "",    null: false
    t.string   "encrypted_password",          default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.float    "hour_worked_per_week"
    t.float    "no_of_week_holiday_per_year"
    t.decimal  "overhead_per_hour"
    t.boolean  "approved",                    default: false, null: false
    t.boolean  "admin",                       default: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
