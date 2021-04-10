

ActiveRecord::Schema.define(version: 2021_04_03_012344) do

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.date "event_date"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "venue"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "attendee_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendee_id"], name: "index_invitations_on_attendee_id"
    t.index ["event_id"], name: "index_invitations_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "events", "users"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "users", column: "attendee_id"
end
