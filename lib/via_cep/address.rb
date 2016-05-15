require_relative 'methods'

module ViaCep
  class Address
    def initialize(zipcode)
      @response = HTTParty.get("https://viacep.com.br/ws/#{zipcode}/json/")

      if !ViaCep::Validators::Zipcode.valid?(zipcode)
        raise ViaCep::Errors::InvalidZipcodeFormat
      elsif @response['erro']
        raise ViaCep::Errors::ZipcodeNotFound
      end
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        @response[response_method_name]
      end
    end
  end
end
