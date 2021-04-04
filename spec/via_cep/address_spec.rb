# frozen_string_literal: true

require 'spec_helper'

describe ViaCep::Address do
  let(:valid_response) { mock_response(code: '200', body: load_fixture('valid_zipcode.json')) }
  let(:invalid_response) { mock_response(code: '200', body: load_fixture('invalid_zipcode.json')) }

  context 'with a valid zipcode' do
    let(:zipcode)   { ViaCep::Address.new('01001-000') }

    before { allow(Net::HTTP).to receive(:get_response).and_return(valid_response) }

    it 'has a zipcode method' do
      expect(zipcode).to respond_to(:zipcode)
      expect(zipcode.zipcode).to eq('01001-000')
    end

    it 'has a street method' do
      expect(zipcode).to respond_to(:street)
      expect(zipcode.street).to eq('Praça da Sé')
    end

    it 'has a complement method' do
      expect(zipcode).to respond_to(:complement)
      expect(zipcode.complement).to eq('lado ímpar')
    end

    it 'has a neighborhood method' do
      expect(zipcode).to respond_to(:neighborhood)
      expect(zipcode.neighborhood).to eq('Sé')
    end

    it 'has a city method' do
      expect(zipcode).to respond_to(:city)
      expect(zipcode.city).to eq('São Paulo')
    end

    it 'has a state method' do
      expect(zipcode).to respond_to(:state)
      expect(zipcode.state).to eq('SP')
    end

    it 'has a ibge method' do
      expect(zipcode).to respond_to(:ibge)
      expect(zipcode.ibge).to eq('3550308')
    end

    it 'has a gia method' do
      expect(zipcode).to respond_to(:gia)
      expect(zipcode.gia).to eq('1004')
    end

    it 'has a ddd method' do
      expect(zipcode).to respond_to(:ddd)
      expect(zipcode.ddd).to eq('11')
    end

    it 'has a siafi method' do
      expect(zipcode).to respond_to(:siafi)
      expect(zipcode.siafi).to eq('7107')
    end
  end

  context 'with an invalid zipcode' do
    before { allow(Net::HTTP).to receive(:get_response).and_return(invalid_response) }

    it 'raises ViaCep::Errors::ZipcodeNotFound' do
      expect {
        ViaCep::Address.new('28035019')
      }.to raise_error(ViaCep::Errors::ZipcodeNotFound)
    end
  end
end
