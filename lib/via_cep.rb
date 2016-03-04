require 'via_cep/version'
require 'httparty'

module ViaCep
  class CEP
    def initialize(cep)
      begin
        @cep = cep.to_s
        @response = HTTParty.get("https://viacep.com.br/ws/#{@cep}/json/")
      raise RuntimeError unless correct_format(cep.to_s)
      end
    end

    def street
      @response["logradouro"]
    end

    def complement
      @response["complemento"]
    end

    def neighborhood
      @response["bairro"]
    end

    def city
      @response["localidade"]
    end

    def state
      @response["uf"]
    end

    def ibge
      @response["ibge"]
    end

    def gia
      @response["gia"]
    end

    def correct_format(cep)
      return true if cep.match(/\d{5}(-)\d{3}\z/) or cep.match(/\d{8}/)
    end
  end
end
