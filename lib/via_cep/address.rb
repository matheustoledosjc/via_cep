module ViaCep
  class Address
    attr_reader :response

    def initialize(zipcode)
      begin
        @response = HTTParty.get("https://viacep.com.br/ws/#{zipcode}/json/")
      raise ArgumentError, 'Invalid zipcode format' unless ViaCep::Format.valid_format?(zipcode)
      end
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        response[response_method_name]
      end
    end
  end
end
