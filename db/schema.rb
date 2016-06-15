ActiveRecord::Schema.define(version: 20160602095327) do

  create_table "comments", force: :cascade do |t|
    t.text     "message"
    t.string   "author"
    t.integer  "walker_id"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.text     "name"
    t.text     "breed"
    t.text     "weight"
    t.text     "suburb"
    t.text     "concerns"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.text     "name"
    t.text     "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "email"
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true

  create_table "walkers", force: :cascade do |t|
    t.text     "name"
    t.text     "experience"
    t.text     "suburbs"
    t.boolean  "car"
    t.text     "wage"
    t.text     "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "email"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "walkers", ["email"], name: "index_walkers_on_email", unique: true

end
