class Oystercard

  attr_reader :balance

  MAX_AMOUNT = 90
  MIN_FARE = 1
  PENALTY_FARE = 6
  MAX_ERROR = "Cannot exceed max balance £#{MAX_AMOUNT}"
  MIN_ERROR = "You need to have at least £#{MIN_FARE}"

  def initialize(journey_log_class, journey_class)
    @station = nil
    @balance = 0
    @journey_log_class = journey_log_class
    @journey_log = journey_log_class.new(journey_class)
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(entry_station)
    raise MIN_ERROR unless balance >= MIN_FARE
    @journey_log.start(entry_station)
    deduct(@journey_log.fare) if in_journey?
    @station = entry_station
  end

  def in_journey?
    !!@station
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct(@journey_log.fare)
    @station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
