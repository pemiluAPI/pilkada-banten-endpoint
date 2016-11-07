class CreateVisiMisiWahidinAndikas < ActiveRecord::Migration
  def change
    create_table :visi_misi_wahidin_andikas do |t|
      t.text :visi
      t.text :misi
    end
  end
end
