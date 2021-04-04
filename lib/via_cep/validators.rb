# frozen_string_literal: true

module ViaCep
  module Validators
    module State
      class << self
        #
        # Validates if the state passed is a valid one.
        #
        # Return if is valid or not
        #   ViaCep::Validators::State.valid?('foo')
        #   #=> false
        #   ViaCep::Validators::State.valid?('RJ')
        #   #=> true
        #
        # return Boolean
        #
        def valid?(state)
          %w[
            AC AL AP AM BA CE DF ES GO
            MA MT MS MG PR PB PA PE PI
            RJ RN RS RO RR SC SE SP TO
          ].include?(state.to_s)
        end
      end
    end

    # Zipcode validator
    module Zipcode
      class << self
        #
        # Validates if the zipcode passed is a valid one.
        #
        # Return if is valid or not
        #   ViaCep::Validators::Zipcode.valid?('0')
        #   #=> false
        #   ViaCep::Validators::Zipcode.valid?('01001000')
        #   #=> true
        #
        # return Boolean
        #
        def valid?(zipcode)
          zipcode = zipcode.to_s
          !!zipcode.match(/^[0-9]{5}(-)[0-9]{3}$/) || !!zipcode.match(/^[0-9]{8}$/)
        end
      end
    end
  end
end
