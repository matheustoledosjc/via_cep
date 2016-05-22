module ViaCep
  module Errors
    class InvalidStateFormat < ArgumentError
      attr_reader :message

      def initialize
        @message = 'State has an invalid format'
      end
    end
  end
end
