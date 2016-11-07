class CreatePartisipasiPilkadas < ActiveRecord::Migration
  def change
    create_table :partisipasi_pilkadas do |t|
      t.string :kabupaten_kota
      t.string :administrasi_daerah
      t.string :data_pemilihan_lakilaki
      t.string :data_pemilihan_perempuan
      t.string :data_pemilihan_total
      t.string :penggunaan_hak_pilih_lakilaki
      t.string :penggunaan_hak_pilih_perempuan
      t.string :penggunaan_hak_pilih_total
      t.float :persentase_pemilih
      t.string :suara_sah
      t.string :suara_tidak_sah
      t.string :suara_total
      t.string :jumlah_disabilitas
      t.string :partisipasi_disabilitas
      t.float :persentase_pengguna_disabilitas

      t.timestamps
    end
  end
end
