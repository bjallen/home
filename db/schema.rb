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

ActiveRecord::Schema.define(version: 20150111234059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "spark_cores", force: :cascade do |t|
    t.string   "device_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temperature_readings", force: :cascade do |t|
    t.decimal  "temperature",    precision: 7, scale: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "thermometer_id"
  end

  add_index "temperature_readings", ["thermometer_id"], name: "index_temperature_readings_on_thermometer_id", using: :btree

  create_table "thermometers", force: :cascade do |t|
    t.integer  "spark_core_id"
    t.string   "room"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "thermometers", ["spark_core_id"], name: "index_thermometers_on_spark_core_id", using: :btree

  add_foreign_key "temperature_readings", "thermometers"
  add_foreign_key "thermometers", "spark_cores"
end
