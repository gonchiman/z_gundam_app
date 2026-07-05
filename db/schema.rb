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

ActiveRecord::Schema[8.1].define(version: 2026_07_05_083000) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "crew_members", force: :cascade do |t|
    t.integer "combat_power"
    t.datetime "created_at", null: false
    t.string "gender"
    t.integer "hire_cost"
    t.string "name"
    t.string "rank"
    t.string "role_type"
    t.datetime "updated_at", null: false
  end

  create_table "mobile_suits", force: :cascade do |t|
    t.integer "combat_power"
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "purchase_cost"
    t.datetime "updated_at", null: false
  end

  create_table "pilot_assignments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "crew_member_id", null: false
    t.integer "mobile_suit_id"
    t.datetime "updated_at", null: false
    t.integer "warship_id", null: false
    t.index ["crew_member_id"], name: "index_pilot_assignments_on_crew_member_id"
    t.index ["warship_id"], name: "index_pilot_assignments_on_warship_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "name"
    t.string "password_digest", null: false
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "warship_mobile_suits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "mobile_suit_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "updated_at", null: false
    t.integer "warship_id", null: false
    t.index ["mobile_suit_id"], name: "index_warship_mobile_suits_on_mobile_suit_id"
    t.index ["warship_id", "mobile_suit_id"], name: "index_warship_mobile_suits_on_warship_id_and_mobile_suit_id", unique: true
    t.index ["warship_id"], name: "index_warship_mobile_suits_on_warship_id"
  end

  create_table "warships", force: :cascade do |t|
    t.integer "budget", default: 1000000, null: false
    t.integer "captain_id"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_warships_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "pilot_assignments", "crew_members"
  add_foreign_key "pilot_assignments", "warships"
  add_foreign_key "sessions", "users"
  add_foreign_key "warship_mobile_suits", "mobile_suits"
  add_foreign_key "warship_mobile_suits", "warships"
  add_foreign_key "warships", "users"
end
