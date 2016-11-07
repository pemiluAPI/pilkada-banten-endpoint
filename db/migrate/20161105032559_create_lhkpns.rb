class CreateLhkpns < ActiveRecord::Migration
  def change
    create_table :lhkpns do |t|
      t.text :jenis_harta
      t.text :keterangan
      t.string :nilai
      t.string :tahun
      t.text :status
    end
  end
end
