require 'spec_helper'

describe ViaCep::Errors::InvalidZipcodeFormat do
  context 'error handling' do
    it 'does raise an error' do
      dbl = double
      allow(dbl).to receive(:error) { raise ViaCep::Errors::InvalidZipcodeFormat }
      expect do
        dbl.error
      end.to raise_error ViaCep::Errors::InvalidZipcodeFormat
    end
  end
end
