# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_05_205931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "manufacturer"
    t.string "year"
    t.integer "mileage"
    t.string "location"
    t.integer "price"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_cars_on_category_id"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hires", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "user_id", null: false
    t.string "status", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_hires_on_car_id"
    t.index ["user_id"], name: "index_hires_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "user_id", null: false
    t.integer "value", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_ratings_on_car_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "user_id", null: false
    t.string "status", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_sales_on_car_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "email"
    t.string "telephone"
    t.string "password_digest"
    t.boolean "verified", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cars", "categories"
  add_foreign_key "cars", "users"
  add_foreign_key "hires", "cars"
  add_foreign_key "hires", "users"
  add_foreign_key "ratings", "cars"
  add_foreign_key "ratings", "users"
  add_foreign_key "sales", "cars"
  add_foreign_key "sales", "users"
end
