require_relative 'journey'
require_relative 'journey_log'


class Oystercard
  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1
  MAX_FARE = 6

  attr_reader :balance, :journeys#, :one_journey

  def initialize(balance = DEFAULT_BALANCE)#journey: Journey)
    @balance = balance
    @journeys = JourneyLog.new
    # @journey_class = journey
    # @one_journey = {}
  end

  def top_up(amount)
    raise "Exceeded £#{MAX_LIMIT} limit" if max_reached?(amount)
    @balance += amount
  end
 # def touch_in(station, journey) same for touch_out
 # instantiate journey with Journey.new, store as @ and
 # push and call @journey.start or use attr ie journey.start
  def touch_in(station)
    not_touched_out
    no_min_fare
    one_journey_created(station)
  end

  def touch_out(station)
    not_touched_in
    one_journey_finished(station)

  end

  private

  def journey
    @journey ||= Journey.new #Why ||
  end

  def start(a_station)
    journey.start(a_station)
  end

  def end_at(a_station)
    journey.end(a_station)
  end

#sort out line 56 and 61
# move to journey class method
  def one_journey_created(station)
    start(station)
    # @one_journey[:entry_station] = journey
    #Do i need journey
    completed_journey
  end

  def one_journey_finished(station)
    end_at(station)
    # @one_journey[:exit_station] = journey
    #Do i need journey
    # completed_journey
  end

  def not_touched_out
    if journey.finish.nil?
      deduct(MAX_FARE)
      one_journey_finished('Not_exited')
    end
  end

  def not_touched_in
    if journey.entry.nil?
      deduct(MAX_FARE)
      one_journey_created('Not_entered')
    else
      deduct(MIN_FARE)
    end
  end

  def no_min_fare
    raise "You must have over £#{MIN_FARE} on your card" if min_reached?
  end

  def max_reached?(amount)
    @balance + amount > MAX_LIMIT
  end

  def min_reached?
    @balance < MIN_FARE
  end

  def deduct(fare)
    @balance -= fare
  end

  # def store_journey
  #   completed_journey
  #   # new_journey
  # end

  def completed_journey
    @journeys.store(journey)
  end

  # def new_journey
  #   @one_journey = {}
  # end
end
