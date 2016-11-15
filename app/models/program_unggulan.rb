class ProgramUnggulan < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(program_unggulan = nil)
    where(program_unggulan: program_unggulan).first_or_create
  end

  def self.apiall(data = {})
    program_unggulan          = self.by_id(data[:id])
    paginate_program_unggulan = program_unggulan.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      program_unggulan: paginate_program_unggulan.map{|value| value.construct},
      count: paginate_program_unggulan.count,
      total: program_unggulan.count
    }
  end

  def construct
    return {
      id: id,
      program_unggulan: program_unggulan,
      deskripsi: deskripsi,
      detail_deskripsi: detail_deskripsi,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end
  
end
