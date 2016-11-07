class CreateAnggaranPilkadas < ActiveRecord::Migration
  def change
    create_table :anggaran_pilkadas do |t|
      t.text :detil_anggaran
      t.string :jumlah_anggaran
      t.text :status_anggaran

      t.timestamps
    end
  end
end
