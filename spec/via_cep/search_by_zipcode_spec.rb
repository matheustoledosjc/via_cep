require 'spec_helper'

describe ViaCep::SearchByAddress do
  let(:valid_address_search)   { ViaCep::SearchByAddress.new(state: 'SP', city: 'São Paulo', street: 'Praça da Sé') }

  context 'with a valid zipcode' do
    it 'has a zipcode method' do
      expect(valid_address_search).to respond_to(:zipcode)
      expect(valid_address_search.zipcode).to eq('01001-000')
    end

    it 'has a street method' do
      expect(valid_address_search).to respond_to(:street)
      expect(valid_address_search.street).to eq('Praça da Sé')
    end

    it 'has a complement method' do
      expect(valid_address_search).to respond_to(:complement)
      expect(valid_address_search.complement).to eq('lado ímpar')
    end

    it 'has a neighborhood method' do
      expect(valid_address_search).to respond_to(:neighborhood)
      expect(valid_address_search.neighborhood).to eq('Sé')
    end

    it 'has a city method' do
      expect(valid_address_search).to respond_to(:city)
      expect(valid_address_search.city).to eq('São Paulo')
    end

    it 'has a state method' do
      expect(valid_address_search).to respond_to(:state)
      expect(valid_address_search.state).to eq('SP')
    end

    it 'has a ibge method' do
      expect(valid_address_search).to respond_to(:ibge)
      expect(valid_address_search.ibge).to eq('3550308')
    end

    it 'has a gia method' do
      expect(valid_address_search).to respond_to(:gia)
      expect(valid_address_search.gia).to eq('1004')
    end
  end
end
