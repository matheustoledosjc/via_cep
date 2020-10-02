# frozen_string_literal: true

module ViaCep
  module Validators
    # Zipcode validator
    module Zipcode
      class << self
        def valid?(zipcode)
          zipcode = zipcode.to_s

          return true if match_regex?(zipcode)
        end

        def match_regex?(zipcode)
          zipcode = zipcode.to_s
          zipcode.match(/^[0-9]{5}(-)[0-9]{3}$/) || zipcode.match(/^[0-9]{8}$/)
        end
      end
    end
  end
end
