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

ActiveRecord::Schema.define(version: 20150911154538) do

  create_table "emissions", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "key",                   limit: 255
    t.string   "country",               limit: 255
    t.string   "state",                 limit: 255
    t.string   "city",                  limit: 255
    t.string   "email",                 limit: 255
    t.integer  "template",              limit: 4
    t.integer  "content",               limit: 4
    t.integer  "channel",               limit: 4
    t.boolean  "send_restart"
    t.string   "news_source",           limit: 255
    t.boolean  "football"
    t.string   "color",                 limit: 255
    t.string   "path_sponsor",          limit: 255
    t.string   "id_teamviewer",         limit: 255
    t.string   "type_emission",         limit: 255
    t.string   "width",                 limit: 255
    t.string   "height",                limit: 255
    t.boolean  "caller_fullscreen"
    t.string   "name_caller_1",         limit: 255
    t.string   "keycode_up_caller_1",   limit: 255
    t.string   "keycode_down_caller_1", limit: 255
    t.string   "name_caller_2",         limit: 255
    t.string   "keycode_up_caller_2",   limit: 255
    t.string   "keycode_down_caller_2", limit: 255
    t.string   "name_caller_3",         limit: 255
    t.string   "keycode_up_caller_3",   limit: 255
    t.string   "keycode_down_caller_3", limit: 255
    t.string   "name_caller_4",         limit: 255
    t.string   "keycode_up_caller_4",   limit: 255
    t.string   "keycode_down_caller_4", limit: 255
    t.string   "name_caller_5",         limit: 255
    t.string   "keycode_up_caller_5",   limit: 255
    t.string   "keycode_down_caller_5", limit: 255
    t.string   "name_caller_6",         limit: 255
    t.string   "keycode_up_caller_6",   limit: 255
    t.string   "keycode_down_caller_6", limit: 255
    t.integer  "trade_id",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emissions_users", id: false, force: :cascade do |t|
    t.integer "user_id",     limit: 4
    t.integer "emission_id", limit: 4
  end

  add_index "emissions_users", ["emission_id"], name: "index_emissions_users_on_emission_id", using: :btree
  add_index "emissions_users", ["user_id"], name: "index_emissions_users_on_user_id", using: :btree

  create_table "finance_uys", force: :cascade do |t|
    t.string "currency",       limit: 255
    t.float  "buy_now",        limit: 24
    t.float  "sale_now",       limit: 24
    t.string "buy_variatiuon", limit: 255
    t.string "sale_variation", limit: 255
    t.float  "buy_yesterday",  limit: 24
    t.float  "sale_yesterday", limit: 24
    t.string "country",        limit: 255
    t.string "updated",        limit: 255
  end

  create_table "horoscopes", force: :cascade do |t|
    t.string "sign",        limit: 255
    t.string "description", limit: 255
    t.string "language",    limit: 255
    t.string "day",         limit: 255
    t.string "updated",     limit: 255
  end

  create_table "key_auths", force: :cascade do |t|
    t.string   "key_server", limit: 255
    t.string   "key_client", limit: 255
    t.string   "key_status", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", force: :cascade do |t|
    t.string   "cpu",          limit: 255
    t.string   "ram",          limit: 255
    t.string   "disk",         limit: 255
    t.boolean  "status_video"
    t.integer  "emission_id",  limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", force: :cascade do |t|
    t.string   "file_name",     limit: 255
    t.string   "path",          limit: 255
    t.string   "tipe",          limit: 255
    t.string   "size",          limit: 255
    t.string   "md5",           limit: 255
    t.string   "start_publish", limit: 255
    t.string   "end_publish",   limit: 255
    t.integer  "time_to_air",   limit: 4
    t.integer  "position",      limit: 4
    t.integer  "emission_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_uys", force: :cascade do |t|
    t.string "title",       limit: 255
    t.string "description", limit: 255
    t.string "category",    limit: 255
    t.string "image_url",   limit: 255
    t.string "newspaper",   limit: 255
    t.string "updated",     limit: 255
  end

  create_table "powers", force: :cascade do |t|
    t.integer  "day",         limit: 4
    t.string   "start",       limit: 255
    t.string   "end",         limit: 255
    t.integer  "emission_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", force: :cascade do |t|
    t.string   "date",                    limit: 255
    t.integer  "average_time_turnador_1", limit: 4
    t.integer  "average_time_turnador_2", limit: 4
    t.integer  "average_time_turnador_3", limit: 4
    t.integer  "average_time_turnador_4", limit: 4
    t.integer  "average_time_turnador_5", limit: 4
    t.integer  "average_time_turnador_6", limit: 4
    t.integer  "emission_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trades", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "phone",                  limit: 4
    t.integer  "role",                   limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weather_next_days_uys", force: :cascade do |t|
    t.string  "id_up",           limit: 255
    t.string  "city",            limit: 255
    t.string  "country",         limit: 255
    t.integer "temperature_min", limit: 4
    t.integer "temperature_max", limit: 4
    t.string  "description",     limit: 255
    t.integer "humidity",        limit: 4
    t.string  "icon",            limit: 255
    t.string  "pronostic_day",   limit: 255
    t.string  "updated",         limit: 255
  end

  create_table "weather_now_uys", force: :cascade do |t|
    t.string  "city",        limit: 255
    t.string  "country",     limit: 255
    t.integer "temperature", limit: 4
    t.string  "description", limit: 255
    t.integer "humidity",    limit: 4
    t.string  "icon",        limit: 255
    t.integer "wind",        limit: 4
    t.integer "pressure",    limit: 4
    t.string  "updated",     limit: 255
  end

end
