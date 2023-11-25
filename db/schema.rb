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

ActiveRecord::Schema[7.1].define(version: 2023_11_25_212218) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mecanicos", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "adminCode", default: 0
    t.string "nome"
    t.string "telefone"
    t.string "especialidade"
    t.string "endereco"
    t.index ["email"], name: "index_mecanicos_on_email", unique: true
    t.index ["reset_password_token"], name: "index_mecanicos_on_reset_password_token", unique: true
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.text "descricao"
    t.string "modelo"
    t.string "marca"
    t.integer "ano"
    t.string "cor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cliente_id", null: false
    t.index ["cliente_id"], name: "index_veiculos_on_cliente_id"
  end

  add_foreign_key "veiculos", "clientes"
end
