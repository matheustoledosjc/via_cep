# frozen_string_literal: true

module ViaCep
  module Validators
    # State validator
    module State
      class << self
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
        def valid?(zipcode)
          zipcode = zipcode.to_s
          !!zipcode.match(/^[0-9]{5}(-)[0-9]{3}$/) || !!zipcode.match(/^[0-9]{8}$/)
        end
      end
    end
  end
end
