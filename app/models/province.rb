class Province < ActiveRecord::Base
  has_one :proporsi_dprs, foreign_key: "provinsi_id"
  has_many :proporsi_kota, foreign_key: "provinsi_id"
end
