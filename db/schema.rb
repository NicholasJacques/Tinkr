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

ActiveRecord::Schema.define(version: 20170801054925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "year"
    t.string "cylinders"
    t.string "displacement"
    t.string "fuel_type"
    t.string "transmission"
    t.string "speeds"
    t.string "model_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "service_milestones", force: :cascade do |t|
    t.integer "mileage"
    t.bigint "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_service_milestones_on_car_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "item"
    t.string "item_description"
    t.string "action"
    t.string "interval_mileage"
    t.bigint "service_milestone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_milestone_id"], name: "index_services_on_service_milestone_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "account_completed?", default: false
  end

  add_foreign_key "cars", "users"
  add_foreign_key "service_milestones", "cars"
  add_foreign_key "services", "service_milestones"
end
