module ViaCep
  module Format
    def self.valid_format?(zipcode)
      zipcode = zipcode.to_s

      if zipcode.match(/^[0-9]{5}(-)[0-9]{3}$/) || zipcode.match(/^[0-9]{8}$/)
        true
      else
        false
      end
    end
  end
end
