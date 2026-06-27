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

ActiveRecord::Schema[8.1].define(version: 2026_06_27_065808) do
  create_table "crew_members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "gender"
    t.string "name"
    t.string "rank"
    t.string "role_type"
    t.datetime "updated_at", null: false
  end

  create_table "mobile_suits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "warship_id", null: false
    t.index ["warship_id"], name: "index_mobile_suits_on_warship_id"
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

  create_table "warships", force: :cascade do |t|
    t.integer "captain_id"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "mobile_suits", "warships"
  add_foreign_key "pilot_assignments", "crew_members"
  add_foreign_key "pilot_assignments", "warships"
end
