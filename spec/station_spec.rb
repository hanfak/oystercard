require 'station'

describe Station do
  subject {described_class.new("Aldgate", 1)}
  it '#name' do
    expect(subject.name).to eq 'Aldgate'
  end

  it '#zone' do
    expect(subject.zone).to eq 1
  end
end
