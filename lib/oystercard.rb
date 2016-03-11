
class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise max_error if max_reached?(money)
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    in_journey?
  end

  def in_journey?
    true
  end

  private

    def max_reached?(money)
      @balance + money > MAX_BALANCE
    end

    def max_error
      "Maximum balance of #{MAX_BALANCE} has been reached"
    end

end
