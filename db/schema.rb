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

ActiveRecord::Schema.define(version: 20170313190422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "table_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.integer  "num_seats",  null: false
    t.index ["table_id"], name: "index_bookings_on_table_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id", using: :btree
    t.index ["user_id", "restaurant_id"], name: "index_favorites_on_user_id_and_restaurant_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "restaurant_id",      null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["restaurant_id"], name: "index_photos_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_photos_on_user_id", using: :btree
  end

  create_table "restaurant_categories", force: :cascade do |t|
    t.integer  "category_id",   null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id", "restaurant_id"], name: "index_restaurant_categories_on_category_id_and_restaurant_id", unique: true, using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.string   "address",                               null: false
    t.string   "city",                                  null: false
    t.string   "state",                                 null: false
    t.string   "price_range",                           null: false
    t.text     "description",                           null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "owner_id",                              null: false
    t.integer  "zip_code",                              null: false
    t.json     "hours",                                 null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "strategy",           default: "normal", null: false
    t.integer  "dining_time",        default: 60,       null: false
    t.string   "category",                              null: false
    t.index ["name"], name: "index_restaurants_on_name", using: :btree
    t.index ["owner_id"], name: "index_restaurants_on_owner_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "restaurant_id",               null: false
    t.integer  "overall_rating",              null: false
    t.integer  "food_rating",                 null: false
    t.integer  "service_rating",              null: false
    t.integer  "ambience_rating",             null: false
    t.integer  "value_rating",                null: false
    t.integer  "noise_rating",                null: false
    t.text     "body",                        null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "recommended",     default: 0
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id", using: :btree
    t.index ["user_id", "restaurant_id"], name: "index_reviews_on_user_id_and_restaurant_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tables", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "restaurant_id", null: false
    t.integer  "min_seats",     null: false
    t.integer  "max_seats",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id", "name"], name: "index_tables_on_restaurant_id_and_name", unique: true, using: :btree
    t.index ["restaurant_id"], name: "index_tables_on_restaurant_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.integer  "zip_code",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
