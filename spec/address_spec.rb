require 'spec_helper'

describe ViaCep::Address do
  let(:valid_zipcode)   { ViaCep::Address.new('01001-000') }
  let(:invalid_zipcode) { ViaCep::Address.new('00000') }

  it 'has a version number' do
    expect(ViaCep::VERSION).not_to be nil
  end

  context 'with a valid cep' do
    it 'has a zipcode method' do
      expect(valid_zipcode).to respond_to(:zipcode)
      expect(valid_zipcode.zipcode).to eq('01001-000')
    end
    it 'has a street method' do
      expect(valid_zipcode).to respond_to(:street)
      expect(valid_zipcode.street).to eq('Praça da Sé')
    end

    it 'has a complement method' do
      expect(valid_zipcode).to respond_to(:complement)
      expect(valid_zipcode.complement).to eq('lado ímpar')
    end

    it 'has a neighborhood method' do
      expect(valid_zipcode).to respond_to(:neighborhood)
      expect(valid_zipcode.neighborhood).to eq('Sé')
    end

    it 'has a city method' do
      expect(valid_zipcode).to respond_to(:city)
      expect(valid_zipcode.city).to eq('São Paulo')
    end

    it 'has a state method' do
      expect(valid_zipcode).to respond_to(:state)
      expect(valid_zipcode.state).to eq('SP')
    end

    it 'has a ibge method' do
      expect(valid_zipcode).to respond_to(:ibge)
      expect(valid_zipcode.ibge).to eq('3550308')
    end

    it 'has a gia method' do
      expect(valid_zipcode).to respond_to(:gia)
      expect(valid_zipcode.gia).to eq('1004')
    end
  end
end
