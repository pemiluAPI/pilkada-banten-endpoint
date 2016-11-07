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

ActiveRecord::Schema.define(version: 20161105032559) do

  create_table "anggaran_pilkadas", force: true do |t|
    t.text     "detil_anggaran"
    t.string   "jumlah_anggaran"
    t.text     "status_anggaran"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lhkpns", force: true do |t|
    t.text   "jenis_harta"
    t.text   "keterangan"
    t.string "nilai"
    t.string "tahun"
    t.text   "status"
  end

  create_table "partisipasi_pilkadas", force: true do |t|
    t.string   "kabupaten_kota"
    t.string   "administrasi_daerah"
    t.string   "data_pemilihan_lakilaki"
    t.string   "data_pemilihan_perempuan"
    t.string   "data_pemilihan_total"
    t.string   "penggunaan_hak_pilih_lakilaki"
    t.string   "penggunaan_hak_pilih_perempuan"
    t.string   "penggunaan_hak_pilih_total"
    t.float    "persentase_pemilih",              limit: 24
    t.string   "suara_sah"
    t.string   "suara_tidak_sah"
    t.string   "suara_total"
    t.string   "jumlah_disabilitas"
    t.string   "partisipasi_disabilitas"
    t.float    "persentase_pengguna_disabilitas", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prioritas_programs", force: true do |t|
    t.text "prioritas_program"
    t.text "deskripsi"
  end

  create_table "profiles", force: true do |t|
    t.string "wilayah"
    t.string "provinsi"
    t.string "nama_kepala_daerah"
    t.string "gender_kepala_daerah"
    t.string "tempat_lahir_kepala"
    t.string "tanggal_lahir_kepala"
    t.string "pekerjaan_kepala"
    t.string "nama_wakil_kepala_daerah"
    t.string "gender_wakil_kepala_daerah"
    t.string "tempat_lahir_wakil"
    t.string "tanggal_lahir_wakil"
    t.string "pekerjaan_wakilkada"
    t.string "jumlah_dukungan"
    t.string "perolehan_suara"
    t.string "petahana"
    t.string "status_petahana"
    t.text   "partai_pendukung"
  end

  create_table "program_unggulans", force: true do |t|
    t.string "program_unggulan"
    t.text   "deskripsi"
    t.text   "detail_deskripsi"
  end

  create_table "stages", force: true do |t|
    t.text   "tahapan_pilkada"
    t.string "awal"
    t.string "akhir"
  end

  create_table "visi_misi_rano_embays", force: true do |t|
    t.text     "visi"
    t.text     "misi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visi_misi_wahidin_andikas", force: true do |t|
    t.text "visi"
    t.text "misi"
  end

end
