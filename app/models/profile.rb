class Profile < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(wilayah = nil)
    where(wilayah: wilayah).first_or_create
  end

  def self.apiall(data = {})
    profile          = self.by_id(data[:id])
    paginate_profile = profile.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      profile: paginate_profile.map{|value| value.construct},
      count: paginate_profile.count,
      total: profile.count
    }
  end

  def construct
    return {
      id: id,
      wilayah: wilayah,
      provinsi: provinsi,
      nama_kepala_daerah: nama_kepala_daerah,
      gender_kepala_daerah: gender_kepala_daerah,
      tempat_lahir_kepala: tempat_lahir_kepala,
      tanggal_lahir_kepala: tanggal_lahir_kepala,
      pekerjaan_kepala: pekerjaan_kepala,
      nama_wakil_kepala_daerah: nama_wakil_kepala_daerah,
      gender_wakil_kepala_daerah: gender_wakil_kepala_daerah,
      tempat_lahir_wakil: tempat_lahir_wakil,
      pekerjaan_wakilkada: pekerjaan_wakilkada,
      jumlah_dukungan: jumlah_dukungan,
      perolehan_suara: perolehan_suara,
      petahana: petahana,
      status_petahana: status_petahana,
      partai_pendukung: partai_pendukung,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end
end
