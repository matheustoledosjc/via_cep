# encoding: utf-8
# frozen_string_literal: true
require_relative 'methods'

module ViaCep
  # Address class
  class Address
    def initialize(zipcode)
      @response = HTTParty.get("https://viacep.com.br/ws/#{zipcode}/json/")

      raise ViaCep::Errors::ZipcodeNotFound if @response['erro']
      raise ViaCep::Errors::InvalidZipcodeFormat unless ViaCep::Validators::
                                                        Zipcode.valid?(zipcode)
    end

    ViaCep::METHODS.each do |method_name, response_method_name|
      define_method(method_name) do
        @response[response_method_name]
      end
    end
  end
end
