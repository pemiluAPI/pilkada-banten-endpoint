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

    resource :profile_calon do
      desc "Return all profile"
      get do
        {
          result: Profile.all
        }
      end
    end

    resource :partisipasi_pilkada do
      desc "Return all partisipasi_pilkada"
      get do
        {
          partisipasi_pilkada: PartisipasiPilkada.all
        }
      end
    end   
    resource :anggaran_pilkada do
      desc "Return all anggaran_pilkada"
      get do
        {
          anggaran_pilkada: AnggaranPilkada.all
        }
      end
    end   
    resource :visi_misi_wahidin_andika do
      desc "Return all visi_misi_wahidin_andika"
      get do
        {
          visi_misi_wahidin_andika: VisiMisiWahidinAndika.all
        }
      end
    end   
    resource :visi_misi_rano_embay do
      desc "Return all visi_misi_rano_embay"
      get do
        {
          visi_misi_rano_embay: VisiMisiRanoEmbay.all
        }
      end
    end  
    resource :tahapan_pilkada do
      desc "Return all tahapan_pilkada"
      get do
        {
          tahapan_pilkada: Stage.all
        }
      end
    end  
    resource :program_unggulan do
      desc "Return all program_unggulan"
      get do
        {
          program_unggulan: ProgramUnggulan.all
        }
      end
    end   
    resource :prioritas_program_wahidin_andika do
      desc "Return all prioritas_program_wahidin_andika"
      get do
        {
          prioritas_program: PrioritasProgram.all
        }
      end
    end  
    resource :lhkpn_rano do
      desc "Return all lhkpn_rano"
      get do
        {
          lhkpn: Lhkpn.all
        }
      end
    end   
  end
end