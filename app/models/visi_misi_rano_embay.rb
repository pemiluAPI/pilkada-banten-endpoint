class VisiMisiRanoEmbay < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(visi = nil)
    where(visi: visi).first_or_create
  end

  def self.apiall(data = {})
    visi_misi_rano_embay          = self.by_id(data[:id])
    paginate_visi_misi_rano_embay = visi_misi_rano_embay.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      visi_misi_rano_embay: paginate_visi_misi_rano_embay.map{|value| value.construct},
      count: paginate_visi_misi_rano_embay.count,
      total: visi_misi_rano_embay.count
    }
  end

  def construct
    return {
      id: id,
      visi: visi,
      misi: misi,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end
end
