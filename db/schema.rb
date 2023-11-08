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

ActiveRecord::Schema[7.0].define(version: 2023_11_08_124006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ebikes", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "model"
    t.string "description"
    t.float "price", default: 0.0, null: false
    t.string "city", default: "", null: false
    t.float "weight", default: 0.0, null: false
    t.boolean "removed", default: false, null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["seller_id"], name: "index_ebikes_on_seller_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "starting_date", null: false
    t.datetime "ending_date", null: false
    t.bigint "user_id", null: false
    t.bigint "ebike_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.index ["ebike_id"], name: "index_reservations_on_ebike_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "role", default: "", null: false
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ebikes", "users", column: "seller_id"
  add_foreign_key "reservations", "ebikes"
  add_foreign_key "reservations", "users"
end
