class CreateProporsiKota < ActiveRecord::Migration
  def change
    create_table :proporsi_kota do |t|
      t.integer   :jumlah_kursi_anggota
      t.integer   :jumlah_kursi_perempuan
      t.string     :presentase
      t.integer   :city_id
      t.integer   :provinsi_id
    end
    add_index :proporsi_kota, :city_id
    add_index :proporsi_kota, :provinsi_id
  end
end
