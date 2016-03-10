require 'oystercard'

describe Oystercard do
  # let(:station) { double :station,  name: 'Aldgate', zone: '1' }
  let(:journey_log) { double :journey_log }
  let(:journey) { double :journey } #should not use journey but log
  let(:entry_station) { double :station, name: 'Holborn', zone: '1' }
  let(:exit_station) { double :station, name: 'Brixton', zone: '3' }
  subject(:oystercard) { described_class.new }

  describe 'new card' do
    it 'with balance of £0' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'expect to add amount to card balance' do
      expect {oystercard.top_up(10)}.to change{oystercard.balance}.by 10
    end

    it "expects to raise error when max limit exceeded" do
      fare = Oystercard::MAX_LIMIT + 1
      message = "Exceeded £#{Oystercard::MAX_LIMIT} limit"
      expect{oystercard.top_up fare}.to raise_error message
    end
  end

  describe '#touch_in' do

    it 'raises error when minimum balance reached' do
      message = "You must have over £#{Oystercard::MIN_LIMIT} on your card"
      expect {oystercard.touch_in(entry_station)}.to raise_error message
    end

    it 'starts a journey' do
      oystercard.top_up(1)
      expect(oystercard.journey_log).to receive(:start_journey)
      oystercard.touch_in(entry_station)
    end
  end

  describe '#touch_out' do
    before do
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
    end

    it 'deducts fare from balance after touching out' do
      # allow(journey_log).to receive(:fare).and_return(3)
      allow(journey ).to receive(:fare).and_return(3)
      expect{oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by -3
    end

    it 'finishes a journey' do
      expect(oystercard.journey_log).to receive(:finish_journey)
      oystercard.touch_out(exit_station)
    end
  end
end
