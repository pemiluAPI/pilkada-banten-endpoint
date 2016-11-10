class Lhkpn < ActiveRecord::Base
validates :id,
  					presence: true,
  					uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(jenis_harta = nil)
  	where(jenis_harta: jenis_harta).first_or_create
  end

  def self.apiall(data = {})
    lhkpn_rano          = self.by_id(data[:id])
    paginate_lhkpn_rano = lhkpn_rano.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      lhkpn_rano: paginate_lhkpn_rano.map{|value| value.construct},
      count: paginate_lhkpn_rano.count,
      total: lhkpn_rano.count
		}
  end

  def construct
    return {
      id: id,
      jenis_harta: jenis_harta,
      keterangan: keterangan,
      nilai: nilai,
      tahun: tahun,
      status: status,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end

end
