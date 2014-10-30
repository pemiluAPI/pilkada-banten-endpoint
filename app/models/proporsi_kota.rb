class ProporsiKota < ActiveRecord::Base
  self.primary_key = "id"
  belongs_to :city,
    -> { select("id, nama") },
    foreign_key: "city_id"
  belongs_to :province,
    -> { select("id, nama_lengkap") },
    foreign_key: "provinsi_id"
end
