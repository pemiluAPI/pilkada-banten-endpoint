class Stage < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(tahapan_pilkada = nil)
    where(tahapan_pilkada: tahapan_pilkada).first_or_create
  end

  def self.apiall(data = {})
    stage          = self.by_id(data[:id])
    paginate_stage = stage.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      stage: paginate_stage.map{|value| value.construct},
      count: paginate_stage.count,
      total: stage.count
    }
  end

  def construct
    return {
      id: id,
      tahapan_pilkada: tahapan_pilkada,
      awal: awal,
      akhir: akhir,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end
end
