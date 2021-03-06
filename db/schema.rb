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

ActiveRecord::Schema.define(version: 20151201051428) do

  create_table "cars", force: true do |t|
    t.integer  "year"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "make"
  end

  create_table "drivers", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cell_phone"
  end

  create_table "notifications", force: true do |t|
    t.integer  "driver_id"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.datetime "reserved_from"
    t.datetime "reserved_to"
    t.datetime "returned_at"
    t.integer  "car_id"
    t.integer  "driver_id"
  end

end
