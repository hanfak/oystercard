class Station
  attr_reader :zone, :name

  def initialize(name: nil, zone: nil)
    @name = name
    @zone = zone
  end
end
