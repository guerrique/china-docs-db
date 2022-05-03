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

ActiveRecord::Schema.define(version: 2022_05_03_054929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "doc_id"
    t.index ["doc_id"], name: "index_awards_on_doc_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.string "bio_short"
    t.string "bio_long"
    t.string "birth_year"
    t.string "death_year"
    t.string "bio_source"
    t.string "useful_links", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "docs", force: :cascade do |t|
    t.string "name"
    t.string "chinese_name"
    t.string "year"
    t.string "duration"
    t.string "poster"
    t.string "doc_summary_short"
    t.string "doc_summary_long"
    t.string "doc_summary_source"
    t.string "trailer_link"
    t.string "useful_links", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "description"
    t.string "url"
    t.bigint "doc_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doc_id"], name: "index_links_on_doc_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "director_id"
    t.bigint "doc_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["director_id"], name: "index_projects_on_director_id"
    t.index ["doc_id"], name: "index_projects_on_doc_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "awards", "docs"
  add_foreign_key "links", "docs"
end
