module ViaCep
  module Errors
    class InvalidZipcodeFormat < ArgumentError
      attr_reader :message

      def initialize
        @message = 'Zipcode has an invalid format'
      end
    end
  end
end
