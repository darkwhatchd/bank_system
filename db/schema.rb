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

ActiveRecord::Schema.define(version: 2022_04_14_042529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal "account_balance", precision: 10, scale: 2
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operations", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.decimal "value", precision: 10, scale: 2
    t.datetime "operation_date"
    t.string "operable_type", null: false
    t.bigint "operable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_operations_on_account_id"
    t.index ["operable_type", "operable_id"], name: "index_operations_on_operable"
  end

  create_table "statements", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "finish_date"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_statements_on_account_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "transfer_date"
    t.decimal "value", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "destiny_account_id"
    t.index ["account_id"], name: "index_transfers_on_account_id"
    t.index ["destiny_account_id"], name: "index_transfers_on_destiny_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "withdrawals", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "operations", "accounts"
  add_foreign_key "statements", "accounts"
  add_foreign_key "transfers", "accounts"
  add_foreign_key "transfers", "accounts", column: "destiny_account_id"
end
