# encoding: utf-8
# frozen_string_literal: true

require_relative 'methods'

module ViaCep
  # Search an address
  class SearchByAddress
    def initialize(state:, city:, street:)
      city   = ViaCep::Utils.parameterize(city)
      street = ViaCep::Utils.parameterize(street)

      raise ViaCep::Errors::InvalidStateFormat unless ViaCep::Validators::State.valid?(state)

      uri = URI("#{BASE_URL}/#{state}/#{city}/#{street}/json")
      request = Net::HTTP.get_response(uri)

      @response = JSON.parse(request.body) if request.code === '200'
      raise ViaCep::Errors::AddressNotFound if @response.include?('Bad Request')
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        @response.first[response_method_name]
      end
    end
  end
end
