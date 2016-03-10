class Journey
  attr_reader :entry_station, :exit_station

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @entry_station
    @exit_station
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def complete?
    !(exit_station.nil? || entry_station.nil?)
  end

  def fare
    !complete? ? PENALTY_FARE : zone_fare
  end

  def zone_fare
      MIN_FARE + difference_in_zones
  end

  private

  def difference_in_zones
    (entry_station.zone.to_i - exit_station.zone.to_i).abs
  end
end
