class CreateProporsiDprs < ActiveRecord::Migration
  def change
    create_table :proporsi_dprs do |t|
      t.integer   :jumlah_kursi_anggota
      t.integer   :jumlah_kursi_perempuan
      t.string     :presentase
      t.integer   :provinsi_id
    end
    add_index :proporsi_dprs, :provinsi_id
  end
end
