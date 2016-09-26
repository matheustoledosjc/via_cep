# encoding: utf-8
# frozen_string_literal: true
module ViaCep
  module Errors
    # This class is responsible to show an error
    class ZipcodeNotFound < StandardError
      attr_reader :message

      def initialize
        @message = 'Not found anything for that zipcode'
      end
    end
  end
end
