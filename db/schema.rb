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

ActiveRecord::Schema.define(version: 20160802025420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emotion_tones", force: :cascade do |t|
    t.integer  "anger"
    t.integer  "disgust"
    t.integer  "fear"
    t.integer  "joy"
    t.integer  "sadness"
    t.integer  "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_emotion_tones_on_report_id", using: :btree
  end

  create_table "language_tones", force: :cascade do |t|
    t.integer  "analytical"
    t.integer  "confident"
    t.integer  "tentative"
    t.integer  "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_language_tones_on_report_id", using: :btree
  end

  create_table "profile_summaries", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profile_summaries_on_user_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "profile_summary_id"
    t.text     "text"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["profile_summary_id"], name: "index_reports_on_profile_summary_id", using: :btree
  end

  create_table "social_tones", force: :cascade do |t|
    t.integer  "openness"
    t.integer  "conscientiousness"
    t.integer  "extraversion"
    t.integer  "agreeableness"
    t.integer  "emotional_range"
    t.integer  "report_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["report_id"], name: "index_social_tones_on_report_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_foreign_key "emotion_tones", "reports"
  add_foreign_key "language_tones", "reports"
  add_foreign_key "profile_summaries", "users"
  add_foreign_key "reports", "profile_summaries"
  add_foreign_key "social_tones", "reports"
end
