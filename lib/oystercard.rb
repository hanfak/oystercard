require_relative 'journey_log'

class Oystercard

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_LIMIT = 1

  attr_reader :balance, :journey_log

  def initialize(journey_log = JourneyLog.new(Journey))
    @balance = DEFAULT_BALANCE
    @journey_log = journey_log
  end

  def top_up(amount)
    raise  max_error if max_reached?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise min_limit_error if min_reached?
    no_touch_out unless journey_log.journey.nil?
    journey_log.start_journey(station)
  end

  def touch_out(station)
    journey_log.finish_journey(station)
    deduct
  end
 # If no touch out, but balance is less than 6
  private
    def max_error
      "Exceeded £#{MAX_LIMIT} limit"
    end

    def min_limit_error
      "You must have over £#{MIN_LIMIT} on your card"
    end

    def no_touch_out
      if journey_log.journey.exit_station.nil? && !journey_log.journey.entry_station.nil?
        deduct
        journey_log.no_touch_out
      end
    end

    def max_reached?(amount)
      @balance + amount > MAX_LIMIT
    end

    def min_reached?
      @balance < MIN_LIMIT
    end

    def deduct
      @balance -= journey_log.journey.fare
    end

end
