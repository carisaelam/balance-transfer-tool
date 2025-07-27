# frozen_string_literal: true

require_relative '../main'
require 'stringio'

RSpec.describe Transfer do
  describe '#initialize' do
    context 'when using default initialization' do
      subject(:default_balances) { described_class.new }

      it 'bucket is empty' do
        initialization = default_balances.bucket_balance
        expect(initialization).to be_zero
      end

      it 'credit balances are zero' do
        initialization = default_balances.credit_balances
        expect(initialization).to eq([])
      end
    end

    context 'when specifying both balances' do
      subject(:current_balances) { described_class.new(500, 300) }

      it 'is 500' do
        expect(current_balances.bucket_balance).to eq(500)
      end

      it 'is 300' do
        expect(current_balances.credit_balances).to eq(300)
      end
    end
  end

  describe '#add' do
    subject(:adding) { described_class.new }
    it 'returns the sum of two numbers' do
      result = adding.add([1, 2])
      expect(result).to eq(3)
    end

    it 'works with more than two numbers' do
      result = adding.add([1, 2, 3])
      expect(result).to eq(6)
    end

    it 'works with positive and negative numbers' do
      expect(adding.add([1, -2, 3])).to eq(2)
    end

    it 'returns zero when no input given' do
      expect(adding.add([])).to be_zero
    end
  end

  describe '#find_difference' do
    subject(:subtracting) { described_class.new }
    it 'returns the difference of two numbers' do
      result = subtracting.find_difference(3, 1)
      expect(result).to eq(2)
    end

    it 'returns a negative number when second number is higher than first' do
      result = subtracting.find_difference(1, 3)
      expect(result).to eq(-2)
    end
  end

  describe '#calculate_transfer' do
    it 'subtracts bucket balance from sum of credit balances' do
      transfer = described_class.new(300, [100, 200, 300])
      expect(transfer.calculate_transfer).to eq(300)
    end
  end
end
