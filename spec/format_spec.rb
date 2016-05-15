require 'spec_helper'

describe ViaCep::Format do
  context 'with a valid zipcode' do
    it 'does return true' do
      valid_zipcode = '01001-000'
      formatter = ViaCep::Format.valid_format?(valid_zipcode)
      expect(formatter).to eq(true)
    end
  end

  context 'with an invalid zipcode' do
    it 'does not return true' do
      invalid_zipcode = '01001-01001'
      formatter = ViaCep::Format.valid_format?(invalid_zipcode)
      expect(formatter).not_to eq(true)
    end
  end
end
