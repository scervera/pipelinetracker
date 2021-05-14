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

ActiveRecord::Schema.define(version: 2020_05_12_215252) do

  create_table "account_exec_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "account_executives", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "carrier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apple_cares", force: :cascade do |t|
    t.text "product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "author"
    t.string "content"
    t.integer "opportunity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opportunity_id"], name: "index_comments_on_opportunity_id"
  end

  create_table "engineers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "carrier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "customer_name"
    t.integer "stage", default: 0
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product"
    t.string "sales_stage"
    t.string "purchase_method"
    t.integer "forecast_this_quarter"
    t.date "close_date"
    t.text "use_case"
    t.string "industry"
    t.string "segment"
    t.string "source"
    t.boolean "usma_owned"
    t.text "notes"
    t.boolean "earnings_nomination"
    t.integer "product_id"
    t.integer "sales_stage_id"
    t.integer "account_executive_id"
    t.integer "engineer_id"
    t.integer "user_id"
    t.integer "account_exec_user_id"
    t.integer "sys_engineer_user_id"
    t.string "carrier"
    t.boolean "tracking"
    t.index ["account_exec_user_id"], name: "index_opportunities_on_account_exec_user_id"
    t.index ["account_executive_id"], name: "index_opportunities_on_account_executive_id"
    t.index ["engineer_id"], name: "index_opportunities_on_engineer_id"
    t.index ["product_id"], name: "index_opportunities_on_product_id"
    t.index ["sales_stage_id"], name: "index_opportunities_on_sales_stage_id"
    t.index ["sys_engineer_user_id"], name: "index_opportunities_on_sys_engineer_user_id"
    t.index ["user_id"], name: "index_opportunities_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "category"
    t.string "model"
    t.integer "storage"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_lead_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_stages", force: :cascade do |t|
    t.string "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "support_opportunities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "apple_care_id"
    t.integer "opportunity_id"
    t.date "fiscal_year"
    t.string "fiscal_quarter"
    t.index ["apple_care_id"], name: "index_support_opportunities_on_apple_care_id"
    t.index ["opportunity_id"], name: "index_support_opportunities_on_opportunity_id"
  end

  create_table "sys_engineer_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "role"
    t.string "carrier"
    t.string "firstname"
    t.string "lastname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
