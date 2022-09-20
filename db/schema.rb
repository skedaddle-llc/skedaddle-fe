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

ActiveRecord::Schema.define(version: 2022_09_19_053343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: :cascade do |t|
    t.string "search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "description"
    t.string "directions"
    t.string "lat"
    t.string "lon"
    t.string "activities"
    t.string "url"
    t.string "thumbnail"
    t.bigint "itinerary_id"
    t.index ["itinerary_id"], name: "index_parks_on_itinerary_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "rating"
    t.string "price"
    t.string "image_url"
    t.string "url"
    t.string "categories"
    t.string "address"
    t.string "phone"
    t.bigint "itinerary_id"
    t.index ["itinerary_id"], name: "index_restaurants_on_itinerary_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
  end

  add_foreign_key "itineraries", "users"
  add_foreign_key "parks", "itineraries"
  add_foreign_key "restaurants", "itineraries"
end
