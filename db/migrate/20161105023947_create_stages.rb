class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.text :tahapan_pilkada
      t.string :awal
      t.string :akhir
    end
  end
end
