require 'station'

describe Station do
  subject {described_class.new("Aldgate", 1)}

  describe '#name' do
    it "starts with and knows it's name" do
      expect(subject.name).to eq 'Aldgate'
    end
  end

  describe '#zone' do
    it "starts with and knows it's zone" do
      expect(subject.zone).to eq 1
    end
  end
end
