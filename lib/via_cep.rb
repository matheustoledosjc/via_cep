# frozen_string_literal: true

require 'via_cep/version'
require 'net/http'
require 'uri'
require 'json'

# Validators
require 'via_cep/validators'

# HTTP
require 'via_cep/http'

# Core
require 'via_cep/methods'
require 'via_cep/instance'
require 'via_cep/address'
require 'via_cep/search_by_address'

module ViaCep
  BASE_URL = 'https://viacep.com.br'

  module Errors
    class ZipcodeNotFound < StandardError; end
    class InvalidZipcodeFormat < StandardError; end
    class InvalidStateFormat < StandardError; end
    class InvalidAddressFormat < StandardError; end
    class AddressNotFound < StandardError; end
  end
end
