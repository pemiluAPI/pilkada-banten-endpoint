class CreatePrioritasPrograms < ActiveRecord::Migration
  def change
    create_table :prioritas_programs do |t|
      t.text :prioritas_program
      t.text :deskripsi
    end
  end
end
