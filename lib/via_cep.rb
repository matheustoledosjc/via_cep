require 'httparty'
require 'via_cep/version'

# Core
require 'via_cep/address'
require 'via_cep/methods'

# Validators
require 'via_cep/validators/zipcode'

# Errors
require 'via_cep/errors/invalid_zipcode_format'
require 'via_cep/errors/zipcode_not_found'
