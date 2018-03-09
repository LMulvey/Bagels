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

ActiveRecord::Schema.define(version: 20180308150009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.integer "ticket_id"
    t.string "description"
    t.string "address"
    t.integer "status", null: false
    t.integer "event_type", null: false
    t.integer "measurement"
    t.string "measurement_type"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_events_on_ticket_id"
  end

  create_table "tickets", id: :serial, force: :cascade do |t|
    t.integer "driver_id"
    t.integer "status", null: false
    t.string "description"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_tickets_on_driver_id"
  end

  add_foreign_key "events", "tickets"
  add_foreign_key "tickets", "drivers"
end
