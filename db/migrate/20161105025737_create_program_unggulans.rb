class CreateProgramUnggulans < ActiveRecord::Migration
  def change
    create_table :program_unggulans do |t|
      t.string :program_unggulan
      t.text :deskripsi
      t.text :detail_deskripsi
    end
  end
end
