# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe ViaCep::Errors::ZipcodeNotFound do
  context 'error handling' do
    it 'does raise an error' do
      dbl = double
      allow(dbl).to receive(:error) { raise ViaCep::Errors::ZipcodeNotFound }
      expect do
        dbl.error
      end.to raise_error ViaCep::Errors::ZipcodeNotFound
    end
  end
end
