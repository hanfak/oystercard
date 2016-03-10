require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:station) { double :station }
  let(:other_station) {double :station}

  describe '#start' do
    it 'stores the entry station' do
      journey.start(station)
      expect(journey.entry_station).to eq station
    end
  end

  describe '#finish' do
    it 'stores the exit station' do
      journey.finish(other_station)
      expect(journey.exit_station).to eq other_station
    end
  end

  describe '#complete?' do
    it 'confirms if journey is complete' do
      journey.start(station)
      journey.finish(other_station)
      expect(journey).to be_complete
    end

    context 'incomplete journeys' do
      it 'journey not finished' do
        journey.start(station)
        expect(journey).not_to be_complete
      end

      it 'journey not started' do
        journey.finish(other_station)
        expect(journey).not_to be_complete
      end
    end
  end

  describe '#fare' do
    it 'calculates the fare' do
      journey.start(station)
      journey.finish(other_station)
      expect(journey.fare).to eq Journey::MIN_FARE
    end

    it 'calculates penatly fare' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
