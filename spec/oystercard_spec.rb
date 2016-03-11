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
      message = "Maximum balance of #{max_balance} has been reached"
      expect{oystercard.top_up(max_balance+ 1)}.to raise_error message
    end
  end

  describe '#deduct' do
    before{oystercard.top_up(Oystercard::MAX_BALANCE)}
    it 'should deduct the argument from the balance' do
      oystercard.deduct(Oystercard::MAX_BALANCE)
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#touch_in' do
    it 'should be in journey' do
      oystercard.top_up(Oystercard::FARE)
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

    it 'should raise error if the card does not have enough money' do
      no_money_message = "Nikesh, put some damn money on the card!"
      expect{oystercard.touch_in}.to raise_error no_money_message
    end
  end

  describe '#touch_out' do
    it 'should not be in journey' do
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end
  end



end
