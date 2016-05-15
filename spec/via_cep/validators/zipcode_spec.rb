require 'spec_helper'

describe ViaCep::Validators::Zipcode do
  describe '#valid?' do
    context 'when has a valid zipcode' do
      it 'does match the regex' do
        zipcode = '12345-123'
        expect(ViaCep::Validators::Zipcode.valid?(zipcode)).to eq(true)
      end
    end

    context 'when has an invalid zipcode' do
      it 'does not match the regex' do
        zipcode = '12345-12345'
        expect(ViaCep::Validators::Zipcode.valid?(zipcode)).not_to eq(true)
      end
    end
  end

  describe '#match_regex' do
    context 'when has a valid zipcode' do
      it 'does match the regex' do
        zipcode = '12345-123'
        expect(ViaCep::Validators::Zipcode.match_regex?(zipcode)).not_to eq(nil)
      end
    end

    context 'when has an invalid zipcode' do
      it 'does not match the regex' do
        zipcode = '12345-12345'
        expect(ViaCep::Validators::Zipcode.match_regex?(zipcode)).to eq(nil)
      end
    end
  end
end
