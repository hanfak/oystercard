require_relative 'journey'
class Oystercard
  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1
  MAX_FARE = 6

  attr_reader :balance, :journeys, :one_journey

  def initialize(journey: Journey)
    @balance = DEFAULT_BALANCE
    @journeys = []
    @journey_class = journey
    @one_journey = {}
  end

  def top_up(amount)
    raise "Exceeded £#{MAX_LIMIT} limit" if max_reached?(amount)
    @balance += amount
  end

  # def in_journey?
  #   !journey.empty?
  # end

  def touch_in(station)
    not_touched_out
    raise "You must have over £#{MIN_FARE} on your card" if
    min_reached?
    @journey = @journey_class.new
    @journey.start(station)
    @one_journey[:entry_station] = @journey
  end

  def touch_out(station)
    not_touched_in
    @journey.end(station)
    @one_journey[:exit_station] = @journey
    store_journey
  end

  private

  def not_touched_out
    if @one_journey.size == 1
      deduct(MAX_FARE)
      @journey.end('Not_exited')
      @one_journey[:exit_station] = @journey
      store_journey
    end
  end

  def not_touched_in
    if @one_journey.size == 0
      deduct(MAX_FARE)
      @journey = @journey_class.new
      @journey.start('Not_entered')
      @one_journey[:entry_station] = @journey
    else
      deduct(MIN_FARE)
    end
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

  def store_journey
    completed_journey
    new_journey
  end

  def completed_journey
    @journeys << @journey
  end

  def new_journey
    @one_journey = {}
  end
end
