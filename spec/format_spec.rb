require 'spec_helper'

describe ViaCep::Address do
  context 'with a valid zipcode' do
    it 'does return true' do
      valid_zipcode = '01001-000'
      formatter = ViaCep::Format.valid_format?(valid_zipcode)
      expect(formatter).to eq(true)
    end
  end

  context 'with an invalid zipcode' do
    it 'does return false' do
      invalid_zipcode = '01001-0001'
      formatter = ViaCep::Format.valid_format?(invalid_zipcode)
      expect(formatter).to eq(false)
    end
  end
end
