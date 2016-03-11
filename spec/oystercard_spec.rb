require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe '#initialize' do
    it 'should initialize with a balance' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'should add money to your balance' do
      max_balance = Oystercard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect(oystercard.balance).to eq(max_balance)
    end

    it 'raises error when maximum balance is reached' do
      max_balance = Oystercard::MAX_BALANCE
      message = 'Maximum balance has been reached'
      expect{oystercard.top_up(max_balance+ 1)}.to raise_error message
    end

  end

end
