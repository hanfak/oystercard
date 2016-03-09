class Journey
  attr_reader :entry, :finish
  def initialize
    @entry
    @finish
    
  end

  def start(station)
    @entry = station


  end

  def end(station)
    @finish = station

  end
end
