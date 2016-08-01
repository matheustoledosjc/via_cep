require_relative 'methods'

module ViaCep
  class SearchByAddress
    def initialize(state:, city:, street:)
      city   = ViaCep::Utils.parameterize(city)
      street = ViaCep::Utils.parameterize(street)

      if ViaCep::Validators::State.valid?(state)
        raise ViaCep::Errors::InvalidStateFormat
      end

      @response = HTTParty.get("#{base_url}/#{state}/#{city}/#{street}/json")

      if @response.include?('Bad Request')
        raise ViaCep::Errors::ZipcodeNotFound
      end
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        @response.first[response_method_name]
      end
    end

    private

    def base_url
      "https://viacep.com.br/ws"
    end
  end
end
