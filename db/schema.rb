# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_11_070002) do

  create_table "cliants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "cliant_name", null: false
    t.string "email", null: false
    t.string "tell", null: false
    t.string "fax", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cliants_on_user_id"
  end

  create_table "cost_pdfs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "company_name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "tell", null: false
    t.string "fax", null: false
    t.string "delivery_date", null: false
    t.string "delivery_location", null: false
    t.string "payment_terms", null: false
    t.string "expiration_date", null: false
    t.integer "subtotal", null: false
    t.integer "tax", null: false
    t.integer "total", null: false
    t.string "cliant_name", null: false
    t.string "memo", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cost_pdfs_on_user_id"
  end

  create_table "costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "cliant_name", null: false
    t.date "calendar", null: false
    t.integer "sales", null: false
    t.integer "cost", null: false
    t.integer "profit", null: false
    t.integer "profit_was", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_costs_on_user_id"
  end

  create_table "quotations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cost_pdf_id", null: false
    t.string "product_name", null: false
    t.string "quantity", null: false
    t.string "unit", null: false
    t.string "unit_price", null: false
    t.integer "money", null: false
    t.string "remarks", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cost_pdf_id"], name: "index_quotations_on_cost_pdf_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company", null: false
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

  create_table "works", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "cliant_name", null: false
    t.text "job_description", null: false
    t.date "calendar", null: false
    t.string "work_place", null: false
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "cliants", "users"
  add_foreign_key "cost_pdfs", "users"
  add_foreign_key "costs", "users"
  add_foreign_key "quotations", "cost_pdfs"
  add_foreign_key "works", "users"
end
