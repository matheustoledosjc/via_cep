require 'spec_helper'

describe ViaCep::CEP do
  let(:valid_cep) { ViaCep::CEP.new('01001000') }

  it 'has a version number' do
    expect(ViaCep::VERSION).not_to be nil
  end

  it 'has a method to verify the correct format of a cep' do
  end

  context 'with a valid cep' do
    it 'has a street method' do
      expect(valid_cep).to respond_to(:street)
      expect(valid_cep.street).to eq("Praça da Sé")
    end

    it 'has a complement method' do
      expect(valid_cep).to respond_to(:complement)
      expect(valid_cep.complement).to eq("lado ímpar")
    end

    it 'has a neighborhood method' do
      expect(valid_cep).to respond_to(:neighborhood)
      expect(valid_cep.neighborhood).to eq("Sé")
    end

    it 'has a city method' do
      expect(valid_cep).to respond_to(:city)
      expect(valid_cep.city).to eq("São Paulo")
    end

    it 'has a state method' do
      expect(valid_cep).to respond_to(:state)
      expect(valid_cep.state).to eq("SP")
    end

    it 'has a ibge method' do
      expect(valid_cep).to respond_to(:ibge)
      expect(valid_cep.ibge).to eq("3550308")
    end

    it 'has a gia method' do
      expect(valid_cep).to respond_to(:gia)
      expect(valid_cep.gia).to eq("1004")
    end
  end
end
