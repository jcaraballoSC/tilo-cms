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

ActiveRecord::Schema.define(version: 20150916195757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emissions", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "email"
    t.integer  "template"
    t.integer  "content"
    t.integer  "channel"
    t.boolean  "send_restart"
    t.string   "news_source"
    t.boolean  "football"
    t.string   "color"
    t.string   "path_sponsor"
    t.string   "id_teamviewer"
    t.string   "type_emission"
    t.string   "width"
    t.string   "height"
    t.boolean  "caller_fullscreen"
    t.string   "name_caller_1"
    t.string   "keycode_up_caller_1"
    t.string   "keycode_down_caller_1"
    t.string   "name_caller_2"
    t.string   "keycode_up_caller_2"
    t.string   "keycode_down_caller_2"
    t.string   "name_caller_3"
    t.string   "keycode_up_caller_3"
    t.string   "keycode_down_caller_3"
    t.string   "name_caller_4"
    t.string   "keycode_up_caller_4"
    t.string   "keycode_down_caller_4"
    t.string   "name_caller_5"
    t.string   "keycode_up_caller_5"
    t.string   "keycode_down_caller_5"
    t.string   "name_caller_6"
    t.string   "keycode_up_caller_6"
    t.string   "keycode_down_caller_6"
    t.integer  "trade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emissions_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "emission_id"
  end

  add_index "emissions_users", ["emission_id"], name: "index_emissions_users_on_emission_id", using: :btree
  add_index "emissions_users", ["user_id"], name: "index_emissions_users_on_user_id", using: :btree

  create_table "finance_uys", force: :cascade do |t|
    t.string "currency"
    t.float  "buy_now"
    t.float  "sale_now"
    t.string "buy_variatiuon"
    t.string "sale_variation"
    t.float  "buy_yesterday"
    t.float  "sale_yesterday"
    t.string "country"
    t.string "updated"
  end

  create_table "horoscopes", force: :cascade do |t|
    t.string "sign"
    t.string "description"
    t.string "language"
    t.string "day"
    t.string "updated"
  end

  create_table "key_auths", force: :cascade do |t|
    t.string   "key_server"
    t.string   "key_client"
    t.string   "key_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", force: :cascade do |t|
    t.string   "cpu"
    t.string   "ram"
    t.string   "disk"
    t.boolean  "status_video"
    t.integer  "emission_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", force: :cascade do |t|
    t.string   "file_name"
    t.string   "start_publish"
    t.string   "end_publish"
    t.integer  "time_to_air"
    t.integer  "position"
    t.integer  "emission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_uys", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "category"
    t.string "image_url"
    t.string "newspaper"
    t.string "updated"
  end

  create_table "powers", force: :cascade do |t|
    t.integer  "day"
    t.string   "start"
    t.string   "end"
    t.integer  "emission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", force: :cascade do |t|
    t.string   "date"
    t.integer  "average_time_turnador_1"
    t.integer  "average_time_turnador_2"
    t.integer  "average_time_turnador_3"
    t.integer  "average_time_turnador_4"
    t.integer  "average_time_turnador_5"
    t.integer  "average_time_turnador_6"
    t.integer  "emission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trades", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "name"
    t.string   "start_publish"
    t.string   "end_publish"
    t.integer  "time_to_air"
    t.integer  "position"
    t.integer  "emission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weather_next_days_uys", force: :cascade do |t|
    t.string  "id_up"
    t.string  "city"
    t.string  "country"
    t.integer "temperature_min"
    t.integer "temperature_max"
    t.string  "description"
    t.integer "humidity"
    t.string  "icon"
    t.string  "pronostic_day"
    t.string  "updated"
  end

  create_table "weather_now_uys", force: :cascade do |t|
    t.string  "city"
    t.string  "country"
    t.integer "temperature"
    t.string  "description"
    t.integer "humidity"
    t.string  "icon"
    t.integer "wind"
    t.integer "pressure"
    t.string  "updated"
  end

end
