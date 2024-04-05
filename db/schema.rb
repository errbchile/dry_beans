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

ActiveRecord::Schema[7.1].define(version: 2024_04_05_185251) do
  create_table "collections", charset: "utf8mb4", force: :cascade do |t|
    t.string "client"
    t.string "product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", charset: "utf8mb4", force: :cascade do |t|
    t.string "client"
    t.string "product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

end
