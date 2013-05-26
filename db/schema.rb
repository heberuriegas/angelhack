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

ActiveRecord::Schema.define(:version => 20130526095834) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_venues", :force => true do |t|
    t.integer "category_id"
    t.integer "venue_id"
  end

  create_table "comments", :force => true do |t|
    t.text     "description"
    t.integer  "report_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["report_id"], :name => "index_comments_on_report_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contacts", :force => true do |t|
    t.string   "title"
    t.integer  "type_id"
    t.integer  "venue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["type_id"], :name => "index_contacts_on_type_id"
  add_index "contacts", ["venue_id"], :name => "index_contacts_on_venue_id"

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "content"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "state"
    t.integer  "user_id",                     :null => false
    t.integer  "venue_id"
  end

  add_index "reports", ["user_id"], :name => "index_reports_on_user_id"

  create_table "reports_users", :force => true do |t|
    t.integer  "report_id"
    t.integer  "user_id"
    t.boolean  "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reports_users", ["report_id", "user_id"], :name => "index_reports_users_on_report_id_and_user_id", :unique => true
  add_index "reports_users", ["report_id"], :name => "index_reports_users_on_report_id"
  add_index "reports_users", ["user_id"], :name => "index_reports_users_on_user_id"

  create_table "responses", :force => true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "responses", ["question_id"], :name => "index_responses_on_question_id"

  create_table "surveys", :force => true do |t|
    t.integer  "report_id"
    t.integer  "response_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "surveys", ["report_id"], :name => "index_surveys_on_report_id"
  add_index "surveys", ["response_id"], :name => "index_surveys_on_response_id"

  create_table "types", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role",                   :default => 1
    t.integer  "validate_token"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "postalcode"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "external_type"
    t.string   "external_id"
    t.integer  "user_id"
  end

  create_table "votes", :force => true do |t|
    t.integer  "report_id"
    t.integer  "user_id"
    t.boolean  "calification"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["report_id", "user_id"], :name => "index_votes_on_report_id_and_user_id", :unique => true
  add_index "votes", ["report_id"], :name => "index_votes_on_report_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
