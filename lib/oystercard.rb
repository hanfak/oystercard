
class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise 'Maximum balance has been reached' if max_reached?(money)
    @balance += money
  end

  private

    def max_reached?(money)
      @balance + money > MAX_BALANCE
    end


end
