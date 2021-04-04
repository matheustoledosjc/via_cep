# frozen_string_literal: true

module ViaCep
  class SearchByAddress < Instance
    attr_reader :state, :city, :street

    #
    # Initialize an instance of ViaCep::SearchByAddress and retrieve the CEP using the ViaCep WS API.
    #
    # Search for a zipcode through the address
    #   ViaCep::SearchByAddress.new(state: 'SP', city: 'Sao Paulo', street: 'Praca da Se')
    #   #=> #<ViaCep::SearchByAddress:0x000055e542d90210 @state="SP", @city="Sao Paulo", @street="Praca da Se",
    #   @zipcode="01001-000", @complement="lado impar", @neighborhood="Se", @ibge="3550308", @gia="1004", @error=nil>
    #
    # raise [ViaCep::Errors::InvalidAddressFormat] Error raised when there is any address field empty.
    # raise [ViaCep::Errors::InvalidStateFormat] Error raised when the state is not a valid one
    #
    # return [ViaCep::SearchByAddress]
    #

    def initialize(state:, city:, street:)
      @state = state
      @city = city
      @street = street

      valid?
      call_service
    rescue JSON::ParserError, Net::HTTPBadRequest
      raise ViaCep::Errors::AddressNotFound
    end

    private

    def valid?
      raise ViaCep::Errors::InvalidAddressFormat unless state && city && street
      raise ViaCep::Errors::InvalidStateFormat unless ViaCep::Validators::State.valid?(state)
    end

    def call_service
      request = HTTP.get(path: "#{state}/#{city}/#{street}")
      raise ViaCep::Errors::AddressNotFound unless HTTP.was_successful?(request)

      response = JSON.parse(request.body)
      raise ViaCep::Errors::AddressNotFound if response.length.eql?(0)

      define_attributes(response[0])
    end
  end
end
