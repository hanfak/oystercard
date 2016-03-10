require 'journey_log'

describe JourneyLog do
  let(:JourneyLog) { described_class }
  let(:journey) { double :journey, change_station: nil }
  let(:journey_class) { double :journey_class, new: journey }
  let(:journey_log) { described_class.new(journey_class) }
  let(:station) { double :station }
  describe '#start' do
    before { allow(journey).to receive(:exiting?).and_return(false) }

    it 'starts a new journey at the entry station' do
      expect(journey_class).to receive(:new).with(station)
      journey_log.start(station)
    end

    it 'logs a journey' do
      journey_log.start(station)
      expect(journey_log.list_journeys.size).to eq(1)
    end

    it 'edge case: has two journeys when started twice' do
      journey_log.start(station)
      journey_log.start(station)
      expect(journey_log.list_journeys.size).to eq(2)
    end
  end

  describe '#finish' do
    before { allow(journey).to receive(:exiting?).and_return(true) }

    it 'it adds an exit station to the current journey' do
      journey_log.start(station)
      expect(journey).to receive(:change_station).with(station)
      journey_log.finish(station)
    end

    it 'still contains just one journey' do
      journey_log.start(station)
      journey_log.finish(station)
      expect(journey_log.list_journeys.size).to eq(1)
    end

    it 'creates an incomplete journey when touching out w/out touching in' do
      journey_log.finish(station)
      expect(journey_log.list_journeys.size).to eq(1)
    end
  end

end
