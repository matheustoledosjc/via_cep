# frozen_string_literal: true

module ViaCep
  # Address class
  class Address
    attr_reader :zipcode

    def initialize(zipcode)
      @zipcode = zipcode
      is_zipcode_valid?
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

    def define_attributes(response)
      ViaCep::METHODS.each do |method_name, response_key|
        value = response[response_key.to_s]

        instance_variable_set("@#{method_name}", value)
        self.class.define_method(method_name) do
          instance_variable_get("@#{method_name}")
        end
      end
    end

    def is_zipcode_valid?
      unless ViaCep::Validators::Zipcode.valid?(zipcode)
        raise ViaCep::Errors::InvalidZipcodeFormat
      end
    end
  end
end
