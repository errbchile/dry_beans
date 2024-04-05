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

ActiveRecord::Schema[7.1].define(version: 2024_04_05_190916) do
  create_table "collections", charset: "utf8mb4", force: :cascade do |t|
    t.string "client"
    t.string "product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "path_id", null: false
    t.index ["path_id"], name: "index_collections_on_path_id"
  end

  create_table "deliveries", charset: "utf8mb4", force: :cascade do |t|
    t.string "client"
    t.string "product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "path_id", null: false
    t.index ["path_id"], name: "index_deliveries_on_path_id"
  end

  create_table "itineraries", charset: "utf8mb4", force: :cascade do |t|
    t.string "driver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paths", charset: "utf8mb4", force: :cascade do |t|
    t.string "departure"
    t.string "arrival"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "itinerary_id"
    t.index ["itinerary_id"], name: "index_paths_on_itinerary_id"
  end

  add_foreign_key "collections", "paths"
  add_foreign_key "deliveries", "paths"
  add_foreign_key "paths", "itineraries"
end
