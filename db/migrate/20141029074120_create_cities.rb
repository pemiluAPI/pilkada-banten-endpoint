class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string    :nama
    end
  end
end
