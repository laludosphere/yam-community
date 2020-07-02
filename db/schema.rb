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

ActiveRecord::Schema.define(version: 2020_07_02_072809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.boolean "seen", default: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "premium_subscription_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "premium_subscription_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["premium_subscription_id"], name: "index_orders_on_premium_subscription_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
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
    t.string "city"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "premium_subscriptions", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.bigint "category_id", null: false
    t.string "photo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["category_id"], name: "index_premium_subscriptions_on_category_id"
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
    t.boolean "status_verified", default: false
    t.boolean "owner", default: false
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "flats"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "flats", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "premium_subscriptions"
  add_foreign_key "orders", "users"
  add_foreign_key "preferences", "users"
  add_foreign_key "premium_subscriptions", "categories"
  add_foreign_key "reviews", "users", column: "receiver_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
end
