require 'journey'

describe Journey do
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  describe '#start' do
    it 'stores the touched in station' do
      subject.start(entry_station)
      expect(subject.entry).to be entry_station
    end
  end

  describe '#end' do
    it 'stores the touched out station' do
      subject.end(exit_station)
      expect(subject.finish).to be exit_station
    end
  end
end
