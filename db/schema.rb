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

ActiveRecord::Schema.define(:version => 20121109091627) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "storage"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "dimensions"
  end

  create_table "banners", :force => true do |t|
    t.text     "text"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "title",                            :null => false
    t.text     "text"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.text     "html_keywords",    :default => "", :null => false
    t.text     "html_description", :default => "", :null => false
    t.text     "html_title",       :default => "", :null => false
  end

  create_table "labels", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.text     "html_keywords",    :default => "", :null => false
    t.text     "html_description", :default => "", :null => false
    t.text     "html_title",       :default => "", :null => false
    t.text     "text"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                                 :null => false
    t.integer  "order_id",                                                   :null => false
    t.integer  "count",                                                      :null => false
    t.decimal  "price",      :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "order_infos", :force => true do |t|
    t.integer  "order_id",         :null => false
    t.string   "customer_name"
    t.string   "customer_email"
    t.string   "customer_address"
    t.string   "customer_phone"
    t.text     "comment"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "state"
    t.string   "user_key",                                                   :null => false
    t.decimal  "full_price", :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "product_images", :force => true do |t|
    t.integer  "product_id",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title",                                            :null => false
    t.string   "size_range",                                       :null => false
    t.decimal  "price",             :precision => 10, :scale => 2, :null => false
    t.integer  "label_id"
    t.integer  "category_id",                                      :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "static_pages", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "permalink",                        :null => false
    t.text     "html_keywords",    :default => "", :null => false
    t.text     "html_description", :default => "", :null => false
    t.text     "html_title",       :default => "", :null => false
    t.text     "text"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

end
