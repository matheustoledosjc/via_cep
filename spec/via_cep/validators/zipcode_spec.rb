# frozen_string_literal: true

require 'spec_helper'

describe ViaCep::Validators::Zipcode do
  describe '#valid?' do
    context 'when has a valid zipcode' do
      it 'does match the regex' do
        expect(ViaCep::Validators::Zipcode.valid?('12345-123')).to eq(true)
        expect(ViaCep::Validators::Zipcode.valid?('12345123')).to eq(true)
      end
    end

    context 'when has an invalid zipcode' do
      it 'does not match the regex' do
        expect(ViaCep::Validators::Zipcode.valid?('12345-12345')).not_to eq(true)
        expect(ViaCep::Validators::Zipcode.valid?('12345-12')).not_to eq(true)
        expect(ViaCep::Validators::Zipcode.valid?('12345-1342')).not_to eq(true)
      end
    end
  end
end
