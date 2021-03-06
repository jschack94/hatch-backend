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

ActiveRecord::Schema.define(version: 2018_09_27_222109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.bigint "relationship_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship_id"], name: "index_messages_on_relationship_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "sender_id"
    t.string "text"
    t.boolean "opened", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "mentee_id"
    t.integer "mentor_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id", "mentor_id"], name: "index_relationships_on_mentee_id_and_mentor_id", unique: true
    t.index ["mentee_id"], name: "index_relationships_on_mentee_id"
    t.index ["mentor_id"], name: "index_relationships_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_pic", default: "https://soulcore.com/wp-content/uploads/2018/01/profile-placeholder.png"
    t.string "job_title", default: ""
    t.string "expertiseArray", default: ""
    t.string "bio", default: ""
    t.string "linkedin", default: ""
    t.string "github", default: ""
    t.string "personal_website", default: ""
    t.boolean "mentor_status", default: false
    t.boolean "will_buy_coffee", default: false
    t.bigint "location_id", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_users_on_location_id"
  end

  add_foreign_key "messages", "relationships"
  add_foreign_key "messages", "users"
  add_foreign_key "users", "locations"
end
