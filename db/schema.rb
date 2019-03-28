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

ActiveRecord::Schema.define(version: 20190219072949) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci" do |t|
    t.string "name", default: "", null: false
    t.string "mobile"
    t.string "email"
    t.string "token"
    t.string "password_digest"
    t.text "avatar_data"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci" do |t|
    t.bigint "admin_id"
    t.string "source_type"
    t.bigint "source_id"
    t.json "att_data"
    t.json "info"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_attachments_on_admin_id"
    t.index ["source_type", "source_id"], name: "index_attachments_on_source_type_and_source_id"
  end

  create_table "blogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci" do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.string "title"
    t.string "aasm_state"
    t.text "content"
    t.integer "views_count", default: 0
    t.integer "comments_count", default: 0
    t.text "remark"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_blogs_on_category_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci" do |t|
    t.bigint "user_id"
    t.string "name", default: "", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci" do |t|
    t.string "name", default: "", null: false
    t.string "mobile"
    t.string "email"
    t.integer "user_type", default: 0
    t.integer "gender", default: 0
    t.string "token"
    t.string "password_digest"
    t.text "avatar_data"
    t.text "wechat_data"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
