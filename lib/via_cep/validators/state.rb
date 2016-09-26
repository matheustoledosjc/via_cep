# encoding: utf-8
# frozen_string_literal: true
module ViaCep
  module Validators
    # State validator
    module State
      class << self
        def valid?(state)
          states.include?(state.to_s)
        end

        def states
          %w(
            AC AL AP AM BA CE DF ES GO
            MA MT MS MG PR PB PA PE PI
            RJ RN RS RO RR SC SE SP TO
          )
        end
      end
    end
  end
end
