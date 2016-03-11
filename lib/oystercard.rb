
class Oystercard

  attr_reader :balance, :station

  MAX_BALANCE = 90
  FARE = 1

  def initialize
    @balance = 0
    @station = nil
  end

  def top_up(money)
    raise max_error if max_reached?(money)
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in(station)
    raise no_money_error if aint_got_nuff?
    @station = station
  end

  def touch_out
    deduct(FARE)
    @station = nil
  end

  private

    def aint_got_nuff?
      @balance < FARE
    end

    def max_reached?(money)
      @balance + money > MAX_BALANCE
    end

    def max_error
      "Maximum balance of #{MAX_BALANCE} has been reached"
    end

    def no_money_error
      "Nikesh, put some damn money on the card!"
    end

end
