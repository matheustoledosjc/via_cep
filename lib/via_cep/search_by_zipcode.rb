require_relative 'methods'

module ViaCep
  class SearchByAddress
    def initialize(state:, city:, street:)
      city   = ViaCep::Utils.parameterize(city)
      street = ViaCep::Utils.parameterize(street)

      if state.size != 2
        raise ArgumentError, 'State must have only abbreviations. Eg.: SP'
      end

      @response = HTTParty.get("#{base_url}/#{state}/#{city}/#{street}/json").first
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        @response[response_method_name]
      end
    end

    private

    def base_url
      "https://viacep.com.br/ws"
    end
  end
end
