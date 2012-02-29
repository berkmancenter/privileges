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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120229152427) do

  create_table "affiliations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "affiliations_borrowers", :id => false, :force => true do |t|
    t.integer "borrower_id"
    t.integer "affiliation_id"
  end

  add_index "affiliations_borrowers", ["affiliation_id"], :name => "index_affiliations_borrowers_on_affiliation_id"
  add_index "affiliations_borrowers", ["borrower_id"], :name => "index_affiliations_borrowers_on_borrower_id"

  create_table "attendees", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "borrowers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "middlename"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.date     "dob"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "verified",    :default => false
    t.integer  "event_id"
    t.integer  "attendee_id"
    t.text     "other"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "borrowers", ["email"], :name => "index_borrowers_on_email"
  add_index "borrowers", ["firstname"], :name => "index_borrowers_on_firstname"
  add_index "borrowers", ["lastname"], :name => "index_borrowers_on_lastname"

  create_table "borrowers_affiliations", :id => false, :force => true do |t|
    t.integer "borrower_id"
    t.integer "affiliation_id"
  end

  add_index "borrowers_affiliations", ["affiliation_id"], :name => "index_borrowers_affiliations_on_affiliation_id"
  add_index "borrowers_affiliations", ["borrower_id"], :name => "index_borrowers_affiliations_on_borrower_id"

  create_table "borrowers_card_types", :id => false, :force => true do |t|
    t.integer "borrower_id"
    t.integer "card_type_id"
  end

  add_index "borrowers_card_types", ["borrower_id"], :name => "index_borrowers_card_types_on_borrower_id"
  add_index "borrowers_card_types", ["card_type_id"], :name => "index_borrowers_card_types_on_card_type_id"

  create_table "borrowers_collections", :id => false, :force => true do |t|
    t.integer "borrower_id"
    t.integer "collection_id"
  end

  add_index "borrowers_collections", ["borrower_id"], :name => "index_borrowers_collections_on_borrower_id"
  add_index "borrowers_collections", ["collection_id"], :name => "index_borrowers_collections_on_collection_id"

  create_table "card_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "choices_nodes", :id => false, :force => true do |t|
    t.integer "choice_id"
    t.integer "node_id"
  end

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emails", :force => true do |t|
    t.string   "to"
    t.string   "bcc"
    t.string   "from"
    t.string   "reply_to"
    t.string   "subject"
    t.text     "body"
    t.date     "date_sent"
    t.boolean  "message_sent", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "canceled",    :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "events", ["name"], :name => "index_events_on_name"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id"], :name => "index_events_users_on_event_id"
  add_index "events_users", ["user_id"], :name => "index_events_users_on_user_id"

  create_table "node_paths", :force => true do |t|
    t.text     "path"
    t.integer  "borrower_id"
    t.integer  "session_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "nodes", :force => true do |t|
    t.text     "text"
    t.boolean  "first",      :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "nodes", ["text"], :name => "index_nodes_on_text"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
