# encoding: utf-8
# frozen_string_literal: true
require 'active_support/all'

module ViaCep
  # Utils module
  class Utils
    class << self
      def handle_whitespaces(string)
        string.split(' ').join('%20')
      end

      def handle_accents(string)
        ActiveSupport::Inflector.transliterate(string)
      end

      def parameterize(string)
        string = handle_accents(string)
        handle_whitespaces(string)
      end
    end
  end
end
