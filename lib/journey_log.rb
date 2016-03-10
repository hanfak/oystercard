class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
    @journey = nil
    @journeys = []
  end

  def list_journeys
    @journeys.dup
  end

  def start(entry_station)
    @journey = current_journey(entry_station)
    log_journey
  end

  def finish(exit_station)
    @journey = current_journey(nil)
    @journey.change_station(exit_station)
    log_journey
  end

  def fare
    @journey.calculate_fare
  end

private
  def log_journey
    @journeys.pop if @journey.exiting?
    @journeys << @journey
  end

  def current_journey(station)
    @journey || @journey_class.new(station)
  end

end
