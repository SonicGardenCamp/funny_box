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

ActiveRecord::Schema[7.0].define(version: 2023_09_01_081935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "host_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_posted_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_posts_on_group_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "tag_group_relationships", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_tag_group_relationships_on_group_id"
    t.index ["tag_id"], name: "index_tag_group_relationships_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_group_relationships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_group_relationships_on_group_id"
    t.index ["user_id"], name: "index_user_group_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.text "profile"
    t.string "college"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "posts", "groups"
  add_foreign_key "posts", "users"
  add_foreign_key "tag_group_relationships", "groups"
  add_foreign_key "tag_group_relationships", "tags"
  add_foreign_key "user_group_relationships", "groups"
  add_foreign_key "user_group_relationships", "users"
end
