# encoding: utf-8
# frozen_string_literal: true

require 'spec_helper'

describe ViaCep::SearchByAddress do
  let(:valid_address_search) do
    ViaCep::SearchByAddress.new(state: 'SP',
                                city: 'São Paulo',
                                street: 'Praça da Sé')
  end

  context 'with a valid zipcode' do
    it 'has a zipcode method' do
      expect(valid_address_search).to respond_to(:zipcode)
      expect(valid_address_search.zipcode).not_to be_empty
    end

    it 'has a street method' do
      expect(valid_address_search).to respond_to(:street)
      expect(valid_address_search.street).to eq('Praça da Sé')
    end

    it 'has a complement method' do
      expect(valid_address_search).to respond_to(:complement)
      expect(valid_address_search.complement).not_to be_empty
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
