# frozen_string_literal: true

module ViaCep
  module HTTP
    #
    # Main HTTP module using Net::HTTP
    #
    # return [Net::HTTPOK] | [Net::HTTPBadRequest]
    #
    def self.get(path:, query: {})
      uri = URI(BASE_URL)
      uri.path = "/ws/#{URI.encode(path)}/json"
      uri.query = URI.encode_www_form(query)
      Net::HTTP.get_response(uri)
    end

    def self.was_successful?(request)
      request.code.eql?('200')
    end
  end
end
