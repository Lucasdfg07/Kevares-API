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

ActiveRecord::Schema.define(version: 2021_09_15_234023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "issue_types", force: :cascade do |t|
    t.bigint "issue_id"
    t.bigint "type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_issue_types_on_issue_id"
    t.index ["type_id"], name: "index_issue_types_on_type_id"
  end

  create_table "issues", force: :cascade do |t|
    t.float "latitude"
    t.float "altitude"
    t.float "longitude"
    t.string "image"
    t.string "category"
    t.geography "lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lonlat"], name: "index_issues_on_lonlat", using: :gist
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "issue_id"
    t.integer "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_statuses_on_issue_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
