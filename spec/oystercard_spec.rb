require 'oystercard'

describe Oystercard do
  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { double :journey }
  subject(:oystercard) { described_class.new }

  describe 'new card' do
    it 'with balance of £0' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'expect to add amount to card balance' do
      expect { oystercard.top_up(10) }.to change { oystercard.balance }.by 10
    end

    it 'expects to raise error when max limit exceeded' do
      fare = Oystercard::MAX_LIMIT + 1
      message = "Exceeded £#{Oystercard::MAX_LIMIT} limit"
      expect { oystercard.top_up fare }.to raise_error message
    end
  end

  # describe '#in_journey' do
  #   before do
  #     oystercard.top_up(1)
  #     oystercard.touch_in(entry_station)
  #   end
  #
  #   it 'returns status of card' do
  #     oystercard.touch_out(exit_station)
  #     expect(oystercard).not_to be_in_journey
  #   end
  #
  #   it 'changes status of card to in use after touching in' do
  #     expect(oystercard).to be_in_journey
  #   end
  #
  #   it 'changes status of card to not in use after touching out' do
  #     oystercard.touch_out(exit_station)
  #     expect(oystercard).not_to be_in_journey
  #   end
  # end

  describe '#touch_in' do
    it 'raises error when minimum balance reached' do
      message = "You must have over £#{Oystercard::MIN_FARE} on your card"
      expect { oystercard.touch_in(entry_station) }.to raise_error message
    end

    it 'Stores lastest entry station' do
      allow(journey).to receive(:entry).and_return(entry_station)
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
      expect(oystercard.one_journey[:entry_station]).to eq journey.entry
    end

    it 'charges for incompleted journey' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      expect { oystercard.touch_in(entry_station) }.to change { oystercard.balance }.by -Oystercard::MAX_FARE
    end

    it 'finishes incompleted journey' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      oystercard.touch_in(entry_station)
      expect(oystercard.journeys.last[:exit_station]).to eq 'Not_exited'
    end
  end

  describe '#touch_out' do
    it 'deducts fare from balance after touching out' do
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by -Oystercard::MIN_FARE
    end

    it 'Removes the entry station upon touch out' do
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey).to be_empty
    end

    it 'stores entry station after touching out' do
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys[0][:entry_station]).to eq entry_station
    end

    it 'stores exit station upon touch out' do
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys[0][:exit_station]).to eq exit_station
    end
  end

  describe '#journeys' do
    it 'starts with no journeys' do
      oystercard.top_up(1)
      expect(oystercard.journeys).to be_empty
    end

    it 'stores one complete journey' do
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys.first.values).to eq [entry_station, exit_station]
    end
  end
end
