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

ActiveRecord::Schema[7.0].define(version: 2024_02_09_231943) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "event_id"
    t.string "event_link"
    t.string "event_name"
    t.datetime "event_time"
    t.integer "event_attendance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_members", id: false, force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "event_id", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "link_id"
    t.string "link_name"
    t.string "link_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "meeting_id"
    t.string "meeting_name"
    t.datetime "meeting_time"
    t.integer "meeting_attendance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "member_name"
    t.integer "member_points"
    t.boolean "exec_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
