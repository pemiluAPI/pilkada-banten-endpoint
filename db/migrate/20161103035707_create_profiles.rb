class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :wilayah
      t.string :provinsi
      t.string :nama_kepala_daerah
      t.string :gender_kepala_daerah
      t.string :tempat_lahir_kepala
      t.string :tanggal_lahir_kepala
      t.string :pekerjaan_kepala
      t.string :nama_wakil_kepala_daerah
      t.string :gender_wakil_kepala_daerah
      t.string :tempat_lahir_wakil
      t.string :tanggal_lahir_wakil
      t.string :pekerjaan_wakilkada
      t.string :jumlah_dukungan
      t.string :perolehan_suara
      t.string :petahana
      t.string :status_petahana
      t.text :partai_pendukung
    end
  end
end
