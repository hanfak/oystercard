require 'journey_log'

describe JourneyLog do
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) { double :journey}
  let(:station) { double :station,  name: 'Aldgate', zone: '1'}

  subject(:journey_log) {described_class.new(journey_class)}

  describe '#start' do
    it 'starts a journey' do
      expect(journey).to receive(:start)
      journey_log.start_journey(station)
    end
  end

  describe '#finish' do
    context 'journey complete' do
      it 'finishes a journey' do
        allow(journey).to receive(:complete?).and_return(true)
        expect(journey).to receive(:finish)
        journey_log.finish_journey(station)
      end
    end
  end

end
