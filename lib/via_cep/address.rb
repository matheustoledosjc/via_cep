# frozen_string_literal: true

module ViaCep
  # Address class
  class Address < Instance
    attr_reader :zipcode

    def initialize(zipcode)
      @zipcode = zipcode
      is_valid?
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

    def is_valid?
      unless ViaCep::Validators::Zipcode.valid?(zipcode)
        raise ViaCep::Errors::InvalidZipcodeFormat
      end
    end
  end
end
