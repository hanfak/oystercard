
class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  ZONE_FARE = 1

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end

  def change_station(exit_station)
    @exit_station = exit_station
  end

  def calculate_fare
    return PENALTY_FARE unless complete?
    MINIMUM_FARE + (get_difference * ZONE_FARE)
  end

private

  def complete?
    @entry_station && @exit_station ? true : false
  end

  def get_difference
    (@entry_station.zone - @exit_station.zone).abs
  end

end
