module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :proporsi_dpr do
      desc "Return all Proporsi Kursi Perempuan di DPR"
      get do
        proporsi_dpr = Array.new

        # Prepare conditions based on params
        valid_params = {
          provinsi: 'provinsi_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        ProporsiDpr.includes(:province)
          .where(conditions)
          .each do |proporsi|
            proporsi_dpr << {
              id: proporsi.id,
              provinsi: {
                id: proporsi.province.id,
                nama: proporsi.province.nama_lengkap
              },
              kursi_anggota: proporsi.jumlah_kursi_anggota,
              kursi_perempuan: proporsi.jumlah_kursi_perempuan,
              presentase: proporsi.presentase
            }
          end

        {
          results: {
            count: proporsi_dpr.count,
            proporsi: proporsi_dpr
          }
        }

      end
    end

    resource :proporsi_kota do
      desc "Return all Proporsi Kursi Perempuan di Kabupaten/Kota"
      get do
        proporsi_kota = Array.new

        # Prepare conditions based on params
        valid_params = {
          provinsi: 'provinsi_id',
          kota: 'city_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        ProporsiKota.includes(:city, :province)
          .where(conditions)
          .each do |proporsi|
            proporsi_kota << {
              id: proporsi.id,
              provinsi: {
                id: proporsi.province.id,
                nama: proporsi.province.nama_lengkap,
              },
              kota: {
                id: proporsi.city.id,
                nama: proporsi.city.nama
              },
              kursi_anggota: proporsi.jumlah_kursi_anggota,
              kursi_perempuan: proporsi.jumlah_kursi_perempuan,
              presentase: proporsi.presentase
            }
          end

        {
          results: {
            count: proporsi_kota.count,
            proporsi: proporsi_kota
          }
        }
      end
    end

    resource :provinces do
      desc "Return all provinces"
      get do
        {
          provinces: Province.all
        }
      end
    end
  end
end