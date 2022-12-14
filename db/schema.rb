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

ActiveRecord::Schema.define(version: 2022_09_23_220815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_people", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "person_id", null: false
    t.text "snake", null: false
    t.integer "direction", null: false
    t.string "color", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_alive", default: true, null: false
    t.index ["game_id"], name: "index_game_people_on_game_id"
    t.index ["person_id"], name: "index_game_people_on_person_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "fruit"
  end

  create_table "people", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "game_people", "games"
  add_foreign_key "game_people", "people"
end
