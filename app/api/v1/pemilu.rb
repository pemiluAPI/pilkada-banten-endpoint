module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :profile_calon do
      desc "Return all profile"
      get do
        results = Profile.apiall(params)
        {
          result: results
        }
      end
    end

    resource :partisipasi_pilkada do
      desc "Return all partisipasi_pilkada"
      get do
        results = PartisipasiPilkada.apiall(params)
        {
          results: results
        }
      end
    end   
    resource :anggaran_pilkada do
      desc "Return all anggaran_pilkada"
      get do
        results = AnggaranPilkada.apiall(params)
        {
          results: results
        }
      end
    end   
    resource :visi_misi_wahidin_andika do
      desc "Return all visi_misi_wahidin_andika"
      get do
        results = VisiMisiWahidinAndika.apiall(params)
        {
          results: results
        }
      end
    end   
    resource :visi_misi_rano_embay do
      desc "Return all visi_misi_rano_embay"
      get do
        results = VisiMisiRanoEmbay.apiall(params)
        {
          results: results
        }
      end
    end  
    resource :tahapan_pilkada do
      desc "Return all tahapan_pilkada"
      get do
        results = Stage.apiall(params)
        {
          results: results
        }
      end
    end  
    resource :program_unggulan do
      desc "Return all program_unggulan"
      get do
        results = ProgramUnggulan.apiall(params)
        {
          results: results
        }
      end
    end   
    resource :prioritas_program_wahidin_andika do
      desc "Return all prioritas_program_wahidin_andika"
      get do
        results = PrioritasProgram.apiall(params)
        {
          results: results
        }
      end
    end  
    resource :lhkpn_rano do
      desc "Return all lhkpn_rano"
      get do
        results = Lhkpn.apiall(params)
        {
          results: results
        }
      end
    end   
  end
end