require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe '#initialize' do
    it 'should initialize with a balance' do
      expect(oystercard.balance).to eq(0)
    end
  end

end
