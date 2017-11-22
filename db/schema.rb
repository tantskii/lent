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

ActiveRecord::Schema.define(version: 20171122145426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "pub_date"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "source_id"
    t.index "to_tsvector('russian'::regconfig, (((title)::text || ' '::text) || (description)::text))", name: "posts_idx", using: :gin
    t.index ["source_id"], name: "index_posts_on_source_id"
    t.index ["title", "description", "pub_date", "link"], name: "index_posts_on_title_and_description_and_pub_date_and_link", unique: true
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rus_name"
    t.index "lower((name)::text) varchar_pattern_ops", name: "sources_on_name_idx"
    t.index "lower((rus_name)::text) varchar_pattern_ops", name: "sources_on_rus_name_idx"
    t.index ["link"], name: "index_sources_on_link", unique: true
    t.index ["name"], name: "index_sources_on_name", unique: true
    t.index ["rus_name"], name: "index_sources_on_rus_name", unique: true
  end

  create_table "sources_users", id: false, force: :cascade do |t|
    t.bigint "source_id", null: false
    t.bigint "user_id", null: false
    t.index ["source_id"], name: "index_sources_users_on_source_id"
    t.index ["user_id"], name: "index_sources_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "posts", "sources"
end
