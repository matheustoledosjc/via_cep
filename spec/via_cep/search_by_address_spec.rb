# frozen_string_literal: true

require 'spec_helper'

describe ViaCep::SearchByAddress do
  let(:valid_response) { mock_response(code: '200', body: load_fixture('valid_address_lookup.json')) }
  let(:invalid_response) { mock_response(code: '200', body: load_fixture('invalid_address_lookup.json')) }
  let(:errored_response) { mock_response(code: '400', body: '') }

  context 'with valid params' do
    before { allow(Net::HTTP).to receive(:get_response).and_return(valid_response) }

    let(:search) { ViaCep::SearchByAddress.new(state: 'SP', city: 'São Paulo', street: 'Praça da Sé') }

    it 'has a zipcode method' do
      expect(search).to respond_to(:zipcode)
      expect(search.zipcode).not_to be_empty
    end

    it 'has a street method' do
      expect(search).to respond_to(:street)
      expect(search.street).to eq('Praça da Sé')
    end

    it 'has a complement method' do
      expect(search).to respond_to(:complement)
      expect(search.complement).not_to be_empty
    end

    it 'has a neighborhood method' do
      expect(search).to respond_to(:neighborhood)
      expect(search.neighborhood).to eq('Sé')
    end

    it 'has a city method' do
      expect(search).to respond_to(:city)
      expect(search.city).to eq('São Paulo')
    end

    it 'has a state method' do
      expect(search).to respond_to(:state)
      expect(search.state).to eq('SP')
    end

    it 'has a ibge method' do
      expect(search).to respond_to(:ibge)
      expect(search.ibge).to eq('3550308')
    end

    it 'has a gia method' do
      expect(search).to respond_to(:gia)
      expect(search.gia).to eq('1004')
    end
  end

  context 'with invalid params' do
    context 'when no results' do
      before { allow(Net::HTTP).to receive(:get_response).and_return(invalid_response) }

      it 'raises ViaCep::Errors::AddressNotFound' do
        expect {
          ViaCep::SearchByAddress.new(state: 'SP', city: 'São Paulo', street: 'Fake address')
        }.to raise_error(ViaCep::Errors::AddressNotFound)
      end
    end

    context 'when params are wrong' do
      before { allow(Net::HTTP).to receive(:get_response).and_return(invalid_response) }

      it 'raises ViaCep::Errors::InvalidAddressFormat' do
        expect {
          ViaCep::SearchByAddress.new(state: 'SP', city: nil, street: 'Fake address')
        }.to raise_error(ViaCep::Errors::InvalidAddressFormat)
      end
    end

    context 'when request gone wrong' do
      before { allow(Net::HTTP).to receive(:get_response).and_return(errored_response) }

      it 'raises ViaCep::Errors::InvalidAddressFormat' do
        expect {
          ViaCep::SearchByAddress.new(state: 'SP', city: '', street: '')
        }.to raise_error(ViaCep::Errors::AddressNotFound)
      end
    end
  end
end
