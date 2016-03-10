require 'journey'

describe Journey do
  let(:Journey) { described_class }
  let(:zone_1_station) { double :station, zone: 1 }
  let(:journey) { described_class.new zone_1_station }
  let(:exit_station) { double :station, zone: 1 }
  let(:zone_1_station) { double :station, zone: 1 }
  let(:zone_5_station) { double :station, zone: 5 }

  describe '#calculate_fare' do
    it 'calculates the base fare for no zones crossed' do
      journey.change_station(exit_station)
      expect(journey.calculate_fare).to eq(Journey::MINIMUM_FARE)
    end

    it 'calculates the fair for the difference between the zones' do
      min = Journey::MINIMUM_FARE
      journey.change_station(zone_5_station)
      expect(journey.calculate_fare).to eq(min + 4)
    end

    it 'calculates a penalty fare when journey incomplete' do
      expect(journey.calculate_fare).to eq(Journey::PENALTY_FARE)
    end
  end
end
