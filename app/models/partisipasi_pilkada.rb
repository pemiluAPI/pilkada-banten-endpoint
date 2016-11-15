class PartisipasiPilkada < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(kabupaten_kota = nil)
    where(kabupaten_kota: kabupaten_kota).first_or_create
  end

  def self.apiall(data = {})
    partisipasi_pilkada          = self.by_id(data[:id])
    paginate_partisipasi_pilkada = partisipasi_pilkada.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      partisipasi_pilkada: paginate_partisipasi_pilkada.map{|value| value.construct},
      count: paginate_partisipasi_pilkada.count,
      total: partisipasi_pilkada.count
    }
  end

  def construct
    return {
      id: id,
      kabupaten_kota: kabupaten_kota,
      administrasi_daerah: administrasi_daerah,
      data_pemilihan_lakilaki: data_pemilihan_lakilaki,
      data_pemilihan_perempuan: data_pemilihan_perempuan,
      data_pemilihan_total: data_pemilihan_total,
      penggunaan_hak_pilih_lakilaki: penggunaan_hak_pilih_lakilaki,
      penggunaan_hak_pilih_perempuan: penggunaan_hak_pilih_perempuan,
      penggunaan_hak_pilih_total: penggunaan_hak_pilih_total,
      persentase_pemilih: persentase_pemilih,
      suara_sah: suara_sah,
      suara_tidak_sah: suara_tidak_sah,
      suara_total: suara_total,
      jumlah_disabilitas: jumlah_disabilitas,
      partisipasi_disabilitas: partisipasi_disabilitas,
      persentase_pengguna_disabilitas: persentase_pengguna_disabilitas,
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end
end
