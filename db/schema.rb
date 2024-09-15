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

ActiveRecord::Schema[7.1].define(version: 2024_09_08_140553) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "class_packages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "trainers_id"
    t.decimal "price", precision: 10, scale: 2
    t.integer "duration"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.index ["trainers_id"], name: "index_class_packages_on_trainers_id"
  end

  create_table "districts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "regency_id", null: false
    t.string "name"
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regency_id"], name: "index_districts_on_regency_id"
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.string "employee_id"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.text "address"
    t.string "email"
    t.date "hire_date"
    t.string "job_title"
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "inventories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "inventory_category_id", null: false
    t.integer "quantity"
    t.string "product_image"
    t.date "purchase_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.index ["inventory_category_id"], name: "index_inventories_on_inventory_category_id"
  end

  create_table "inventory_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
  end

  create_table "inventory_conditions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "inventory_id", null: false
    t.string "condition"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_inventory_conditions_on_inventory_id"
  end

  create_table "member_classes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "class_package_id", null: false
    t.date "enrollment_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_package_id"], name: "index_member_classes_on_class_package_id"
    t.index ["member_id"], name: "index_member_classes_on_member_id"
  end

  create_table "members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "users_id"
    t.string "email"
    t.string "handphone_number"
    t.string "gender"
    t.text "address"
    t.string "city"
    t.string "province"
    t.string "emergency_phone_name"
    t.string "emergency_phone_number"
    t.string "emergency_phone_status"
    t.date "membership_start_date"
    t.date "membership_end_date"
    t.integer "created_by"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["users_id"], name: "index_members_on_users_id"
  end

  create_table "membership_packages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10, scale: 2
    t.integer "duration"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
  end

  create_table "permissions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "action"
    t.string "resource"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "product_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.integer "updated_by"
    t.string "created_by_name"
    t.string "updated_by_name"
  end

  create_table "product_transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "transaction_type"
    t.date "transaction_date"
    t.string "transaction_file"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "balance", precision: 10, scale: 2
    t.decimal "refund", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.index ["product_id"], name: "index_product_transactions_on_product_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "product_category_id", null: false
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.string "product_image"
    t.date "expire_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "provinces", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "province_id", null: false
    t.string "name"
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_regencies_on_province_id"
  end

  create_table "register_transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "membership_package_id", null: false
    t.string "transaction_type"
    t.date "transaction_date"
    t.string "transaction_file"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "balance", precision: 10, scale: 2
    t.decimal "refund", precision: 10, scale: 2
    t.string "payment_method"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.index ["member_id"], name: "index_register_transactions_on_member_id"
    t.index ["membership_package_id"], name: "index_register_transactions_on_membership_package_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
  end

  create_table "tests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "users_id"
    t.string "email"
    t.string "handphone_number"
    t.string "gender"
    t.text "address"
    t.string "city"
    t.string "province"
    t.string "emergency_phone_name"
    t.string "emergency_phone_number"
    t.string "emergency_phone_status"
    t.string "specialization"
    t.date "join_date"
    t.date "end_date"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.index ["email"], name: "index_trainers_on_email", unique: true
    t.index ["users_id"], name: "index_trainers_on_users_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "villages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "district_id", null: false
    t.string "name"
    t.integer "created_by"
    t.string "created_by_name"
    t.integer "updated_by"
    t.string "updated_by_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_villages_on_district_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "class_packages", "trainers", column: "trainers_id"
  add_foreign_key "districts", "regencies"
  add_foreign_key "employees", "users"
  add_foreign_key "inventories", "inventory_categories"
  add_foreign_key "inventory_conditions", "inventories"
  add_foreign_key "member_classes", "class_packages"
  add_foreign_key "member_classes", "members"
  add_foreign_key "members", "users", column: "users_id"
  add_foreign_key "permissions", "roles"
  add_foreign_key "product_transactions", "products"
  add_foreign_key "products", "product_categories"
  add_foreign_key "regencies", "provinces"
  add_foreign_key "register_transactions", "members"
  add_foreign_key "register_transactions", "membership_packages"
  add_foreign_key "trainers", "users", column: "users_id"
  add_foreign_key "users", "roles"
  add_foreign_key "villages", "districts"
end
