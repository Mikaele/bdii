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

ActiveRecord::Schema.define(:version => 20131202163624) do

  create_table "categories", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clientes", :force => true do |t|
    t.integer  "pessoa_id"
    t.date     "aniversario"
    t.string   "sexo",        :limit => 10
    t.text     "obs"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "formapagamentoes", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pagamentos", :force => true do |t|
    t.date     "data"
    t.time     "hora"
    t.float    "valor"
    t.integer  "formapagamentoe_id"
    t.integer  "cliente_id"
    t.integer  "servico_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "pagamentos", ["cliente_id"], :name => "index_pagamentos_on_cliente_id"
  add_index "pagamentos", ["formapagamentoe_id"], :name => "index_pagamentos_on_formapagamentoe_id"
  add_index "pagamentos", ["servico_id"], :name => "index_pagamentos_on_servico_id"

  create_table "pessoas", :force => true do |t|
    t.string   "nome"
    t.string   "apelido"
    t.text     "endereco"
    t.string   "celular"
    t.string   "telefone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "realizas", :force => true do |t|
    t.date     "data"
    t.time     "hora"
    t.boolean  "satatus"
    t.string   "obs"
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.integer  "servico_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "realizas", ["cliente_id"], :name => "index_realizas_on_cliente_id"
  add_index "realizas", ["servico_id"], :name => "index_realizas_on_servico_id"
  add_index "realizas", ["usuario_id"], :name => "index_realizas_on_usuario_id"

  create_table "servicos", :force => true do |t|
    t.integer  "category_id"
    t.string   "nome"
    t.float    "preco"
    t.text     "descricao"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "servicos", ["category_id"], :name => "index_servicos_on_category_id"

  create_table "statuspagamentoes", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "nome",                                   :null => false
    t.integer  "pessoa_id",                              :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
