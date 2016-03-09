require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new }
  let(:one_journey) {double :journey}

  describe '#journeys' do
    it 'starts with no journeys' do
      expect(journey_log.list).to be_empty
    end
  end
  describe '#store' do
    it 'store one complete journey in the a journey log' do
      journey_log.store(one_journey)
      expect(journey_log.list).to include one_journey
    end
  end

end
