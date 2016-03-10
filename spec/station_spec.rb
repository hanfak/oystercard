require 'station'

describe Station do
  let(:Station) { described_class }
  let(:station) { described_class.new( name: 'Erika', zone: 5) }

  describe '#initialize' do
    it 'with a name' do
      expect(station.name).to eq 'Erika'
    end

    it 'with a zone' do
      expect(station.zone).to eq 5
    end

  end

end
