module ViaCep
  class Address
    attr_reader :response

    def initialize(zipcode)
      begin
        @response = HTTParty.get("https://viacep.com.br/ws/#{zipcode}/json/")
      raise ArgumentError, 'Invalid zipcode format' unless has_valid_format?(zipcode)
      end
    end

    def has_valid_format?(zipcode)
      zipcode.to_s.match(/\d{5}(-)\d{3}\z/) || zipcode.to_s.match(/\d{8}/)
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        response[response_method_name]
      end
    end
  end
end
