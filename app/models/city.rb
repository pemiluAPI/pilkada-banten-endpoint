class City < ActiveRecord::Base
  has_one :proporsi_kota, foreign_key: "city_id"
end
