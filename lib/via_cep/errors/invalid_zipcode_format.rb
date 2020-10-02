# frozen_string_literal: true

module ViaCep
  module Errors
    # This class is responsible to show an error
    class InvalidZipcodeFormat < ArgumentError
      attr_reader :message

      def initialize
        @message = 'Zipcode has an invalid format'
      end
    end
  end
end
