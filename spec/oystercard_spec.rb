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
      oystercard.top_up(9)
      expect(oystercard.balance).to eq(9)
    end

    it 'should add 4 to my balance' do
      oystercard.top_up(4)
      expect(oystercard.balance).to eq(4)
    end

  end

end
