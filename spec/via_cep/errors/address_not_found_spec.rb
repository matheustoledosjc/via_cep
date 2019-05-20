# encoding: utf-8
# frozen_string_literal: true

require 'spec_helper'

describe ViaCep::Errors::AddressNotFound do
  context 'error handling' do
    it 'does raise an error' do
      address = String
      allow(address).to receive(:error) { raise ViaCep::Errors::AddressNotFound }
      expect do
        address.error
      end.to raise_error ViaCep::Errors::AddressNotFound
    end
  end
end
