class CreateVisiMisiRanoEmbays < ActiveRecord::Migration
  def change
    create_table :visi_misi_rano_embays do |t|
      t.text :visi
      t.text :misi

      t.timestamps
    end
  end
end
