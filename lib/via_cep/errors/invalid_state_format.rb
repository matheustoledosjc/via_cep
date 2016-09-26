# encoding: utf-8
# frozen_string_literal: true
module ViaCep
  module Errors
    # This class is responsible to show an error
    class InvalidStateFormat < ArgumentError
      attr_reader :message

      def initialize
        @message = 'State has an invalid format'
      end
    end
  end
end
