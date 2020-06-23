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

ActiveRecord::Schema.define(version: 2020_06_23_091012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.bigint "flat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flat_id"], name: "index_chatrooms_on_flat_id"
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "city"
    t.string "flat_type"
    t.integer "price_per_month"
    t.date "available_at"
    t.integer "surface_area"
    t.bigint "user_id", null: false
    t.integer "zip_code"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string "flat_type"
    t.integer "price_per_month"
    t.integer "roomates"
    t.integer "surface_area"
    t.string "school_location"
    t.integer "surrounding_area"
    t.boolean "active"
    t.bigint "user_id", null: false
    t.date "moving_at"
    t.float "school_latitude"
    t.float "school_longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "reviewer_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_reviews_on_receiver_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
    t.string "name"
    t.date "born_at"
    t.string "gender"
    t.text "description"
    t.boolean "yam_premium"
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chatrooms", "flats"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "flats", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "preferences", "users"
  add_foreign_key "reviews", "users", column: "receiver_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
end
