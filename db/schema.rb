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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150131231101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: true do |t|
    t.string   "usuario"
    t.string   "password"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "avatar"
    t.boolean  "es_super_usuario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
    t.string   "usuario"
    t.string   "password"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alerta", force: true do |t|
    t.integer  "tipo"
    t.string   "emisor"
    t.string   "mensaje"
    t.boolean  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auth_tokens", force: true do |t|
    t.string   "token"
    t.boolean  "activo"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cita", force: true do |t|
    t.date     "fecha"
    t.string   "hora"
    t.string   "nombre"
    t.string   "telefono_movil"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ciudads", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dia", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipos", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "imagenurl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historials", force: true do |t|
    t.date     "fecha"
    t.string   "detalle"
    t.string   "tratamiento"
    t.integer  "paciente_id"
    t.integer  "patologia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historials", ["paciente_id"], name: "index_historials_on_paciente_id", using: :btree
  add_index "historials", ["patologia_id"], name: "index_historials_on_patologia_id", using: :btree

  create_table "hora_cita", force: true do |t|
    t.time     "hora"
    t.integer  "dias_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horarios", force: true do |t|
    t.string   "dias"
    t.string   "rango_horas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imagens", force: true do |t|
    t.string   "imagen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "informacion_generals", force: true do |t|
    t.string   "nombre_empresa"
    t.string   "direccion"
    t.string   "numero_movil"
    t.string   "numero_fijo"
    t.string   "email"
    t.text     "como_llegar"
    t.text     "quienes_somos"
    t.text     "trayectoria"
    t.text     "valores"
    t.text     "mision"
    t.text     "vision"
    t.text     "politicas_calidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mensajes", force: true do |t|
    t.string   "email"
    t.string   "nombre"
    t.string   "motivo"
    t.text     "mensaje"
    t.boolean  "estado",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticia", force: true do |t|
    t.string   "imagen"
    t.text     "detalle"
    t.string   "titulo"
    t.text     "noticia"
    t.integer  "administrador_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "noticia", ["administrador_id"], name: "index_noticia_on_administrador_id", using: :btree

  create_table "notificacions", force: true do |t|
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: true do |t|
    t.string   "cedula"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "direccion"
    t.string   "email"
    t.string   "genero"
    t.date     "fecha_nac"
    t.string   "tipo_sangre"
    t.string   "password"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pacientes", ["ciudad_id"], name: "index_pacientes_on_ciudad_id", using: :btree

  create_table "patologia", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preguntas_frecuentes", force: true do |t|
    t.string   "pregunta"
    t.string   "respuesta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resumes", force: true do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telefonos", force: true do |t|
    t.string   "numero"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "telefonos", ["paciente_id"], name: "index_telefonos_on_paciente_id", using: :btree

  create_table "tipo_sangres", force: true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tratamientos", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "imagenurl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
