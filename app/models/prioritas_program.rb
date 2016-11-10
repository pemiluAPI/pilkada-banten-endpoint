class PrioritasProgram < ActiveRecord::Base
validates :id,
  					presence: true,
  					uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(prioritas_program = nil)
  	where(prioritas_program: prioritas_program).first_or_create
  end

  def self.apiall(data = {})
    prioritas_program          = self.by_id(data[:id])
    paginate_prioritas_program = prioritas_program.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      prioritas_program: paginate_prioritas_program.map{|value| value.construct},
      count: paginate_prioritas_program.count,
      total: prioritas_program.count
		}
  end

  def construct
    return {
      id: id,
      prioritas_program: prioritas_program,
      deskripsi: deskripsi,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end
end
