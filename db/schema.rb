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

ActiveRecord::Schema.define(version: 20141029074120) do

  create_table "cities", force: true do |t|
    t.string "nama"
  end

  create_table "proporsi_dprs", force: true do |t|
    t.integer "jumlah_kursi_anggota"
    t.integer "jumlah_kursi_perempuan"
    t.string  "presentase"
    t.integer "provinsi_id"
  end

  add_index "proporsi_dprs", ["provinsi_id"], name: "index_proporsi_dprs_on_provinsi_id", using: :btree

  create_table "proporsi_kota", force: true do |t|
    t.integer "jumlah_kursi_anggota"
    t.integer "jumlah_kursi_perempuan"
    t.string  "presentase"
    t.integer "city_id"
    t.integer "provinsi_id"
  end

  add_index "proporsi_kota", ["city_id"], name: "index_proporsi_kota_on_city_id", using: :btree
  add_index "proporsi_kota", ["provinsi_id"], name: "index_proporsi_kota_on_provinsi_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string  "nama"
    t.string  "nama_lengkap"
    t.string  "nama_inggris"
    t.integer "jumlah_kursi"
    t.integer "jumlah_penduduk"
    t.integer "pro_id"
  end

end
