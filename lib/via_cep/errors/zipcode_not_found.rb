module ViaCep
  module Errors
    class ZipcodeNotFound < StandardError
      attr_reader :message

      def initialize
        @message = "Not found anything for that zipcode"
      end
    end
  end
end
