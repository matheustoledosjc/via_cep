# encoding: utf-8
# frozen_string_literal: true

require_relative 'methods'

module ViaCep
  # Address class
  class Address
    def initialize(zipcode)
      uri = URI("#{BASE_URL}/#{zipcode}/json/")
      request = Net::HTTP.get_response(uri)

      raise ViaCep::Errors::InvalidZipcodeFormat unless ViaCep::Validators::
                                                        Zipcode.valid?(zipcode)

      if request.code.eql?('200')
        @response = JSON.parse(request.body)

        raise ViaCep::Errors::ZipcodeNotFound if @response['erro']
      end
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        @response[response_method_name]
      end
    end
  end
end
