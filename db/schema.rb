# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101102224745) do

  create_table "app_profiles", :force => true do |t|
    t.integer  "app_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "action"
  end

  create_table "apps", :force => true do |t|
    t.string   "nombre"
    t.string   "controller"
    t.integer  "nivel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asociacion_perfils", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "containers", :force => true do |t|
    t.text     "template"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contenido_profiles", :force => true do |t|
    t.integer  "contenido_id", :null => false
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contenidos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rotacion"
    t.integer  "tipo_id",      :null => false
    t.date     "fecha"
    t.integer  "app_id"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
  end

  create_table "elementos", :force => true do |t|
    t.integer  "contenido_id", :null => false
    t.text     "valor"
    t.integer  "tipo_id",      :null => false
    t.integer  "ubicacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entities", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "func_apps", :force => true do |t|
    t.integer  "app_id"
    t.string   "nombre"
    t.string   "action"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                :null => false
    t.integer  "order_id",                                  :null => false
    t.integer  "quantity",                                  :null => false
    t.decimal  "total_price", :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type",   :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",       :precision => 8, :scale => 2, :default => 0.0
  end

  create_table "profiles", :force => true do |t|
    t.string   "identificador"
    t.string   "descripcion"
    t.integer  "container_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nivel"
    t.integer  "entity_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tipo_contenidos", :force => true do |t|
    t.string   "template"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_elementos", :force => true do |t|
    t.string   "template"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "profile_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
