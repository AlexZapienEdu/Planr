# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_13_004005) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.integer "dinner_spots_count"
    t.integer "events_count"
    t.integer "dessert_spots_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dessert_spots", force: :cascade do |t|
    t.string "loc_name"
    t.integer "visitor_id"
    t.integer "category_id"
    t.text "desc"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dinner_spots", force: :cascade do |t|
    t.string "loc_name"
    t.integer "visitor_id"
    t.integer "category_id"
    t.text "desc"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_spots", force: :cascade do |t|
    t.string "event_name"
    t.integer "visitor_id"
    t.integer "category_id"
    t.text "desc"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
