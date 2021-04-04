# frozen_string_literal: true

module ViaCep
  class Address < Instance
    attr_reader :zipcode

    #
    # Initialize an instance of ViaCep::Address and retrieve the CEP using the ViaCep WS API.
    #
    # Retrieve a zipcode
    #   ViaCep::Address.new('01001000')
    #   #=> #<ViaCep::Address:0x0000558da60b3770 @zipcode="01001-000",
    #   @street="Praca da Se", @complement="lado impar", @neighborhood="Se", @city="Sao Paulo", @state="SP",
    #   @ibge="3550308", @gia="1004", @error=nil>
    #
    # Retrieve a zipcode with a formatted string
    #   ViaCep::Address.new('01001-000')
    #   #=> #<ViaCep::Address:0x000055e5429aef98 @zipcode="01001-000", @street="Praca da Se", @complement="lado impar",
    #   @neighborhood="Se", @city="Sao Paulo", @state="SP", @ibge="3550308", @gia="1004", @error=nil>
    #
    # raise [ArgumentError] Error raised when zipcode is nil.
    # raise [ViaCep::Errors::InvalidZipcodeFormat] Errorraised when zipcode format is invalid.
    # raise [ViaCep::Errors::ZipcodeNotFound] Error raised when the external API is down or the CEP does not exist.
    #
    # return [ViaCep::Address]
    #

    def initialize(zipcode)
      @zipcode = zipcode
      valid?
      call_service
    rescue JSON::ParserError, Net::HTTPBadRequest
      raise ViaCep::Errors::ZipcodeNotFound
    end

    private

    def call_service
      response = JSON.parse(ViaCep::HTTP.get(path: zipcode).body)
      raise ViaCep::Errors::ZipcodeNotFound if response['erro']

      define_attributes(response)
    end

    def valid?
      raise ViaCep::Errors::InvalidZipcodeFormat unless ViaCep::Validators::Zipcode.valid?(zipcode)
    end
  end
end
