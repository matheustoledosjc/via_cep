# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'via_cep'

def load_fixture(path)
  File.read('spec/via_cep/fixtures/' + path)
end

def mock_response(code:, body:)
  OpenStruct.new(code: code, body: body)
end