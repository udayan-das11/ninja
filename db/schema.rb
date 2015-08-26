# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150826160208) do

# Could not dump table "hosts" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "image_gallaries", force: :cascade do |t|
    t.string   "image_id"
    t.integer  "Host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "image_gallaries", ["Host_id"], name: "index_image_gallaries_on_Host_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "type"
    t.string   "tastetype"
    t.integer  "Menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["Menu_id"], name: "index_items_on_Menu_id"

  create_table "menu_attachments", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "menuType"
    t.string   "experience"
    t.integer  "Host_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "numberGuests"
    t.string   "timeSlot"
    t.string   "daysServed"
    t.string   "menuName"
    t.string   "menuTitle"
  end

  add_index "menus", ["Host_id"], name: "index_menus_on_Host_id"

  create_table "order_tables", force: :cascade do |t|
    t.string   "date"
    t.string   "timeslotfrom"
    t.string   "timeslotto"
    t.string   "customization"
    t.string   "status"
    t.string   "paymentid"
    t.integer  "Host_id"
    t.integer  "User_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "menu_id"
    t.integer  "number_of_guests"
    t.string   "spicy"
    t.string   "celiac"
  end

  add_index "order_tables", ["Host_id"], name: "index_order_tables_on_Host_id"
  add_index "order_tables", ["User_id"], name: "index_order_tables_on_User_id"
  add_index "order_tables", ["menu_id"], name: "index_order_tables_on_menu_id"

  create_table "post_attachments", force: :cascade do |t|
    t.integer  "host_id"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "text"
    t.string   "ambiance"
    t.string   "social"
    t.string   "cooking"
    t.string   "x"
    t.string   "overall"
    t.integer  "user_id"
    t.integer  "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "reviews", ["host_id"], name: "index_reviews_on_host_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "emailId"
    t.string   "authenticated"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
