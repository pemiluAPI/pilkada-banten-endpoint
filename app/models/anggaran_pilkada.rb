class AnggaranPilkada < ActiveRecord::Base
	validates :id,
  					presence: true,
  					uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(detil_anggaran = nil)
  	where(detil_anggaran: detil_anggaran).first_or_create
  end

  def self.apiall(data = {})
    anggaran_pilkada          = self.by_id(data[:id])
    paginate_anggaran_pilkada = anggaran_pilkada.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      anggaran_pilkada: paginate_anggaran_pilkada.map{|value| value.construct},
      count: paginate_anggaran_pilkada.count,
      total: anggaran_pilkada.count
		}
  end

  def construct
    return {
      id: id,
      detil_anggaran: detil_anggaran,
      jumlah_anggaran: jumlah_anggaran,
      status_anggaran: status_anggaran,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end
  
end
