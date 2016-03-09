class JourneyLog
attr_reader :list

  def initialize 
    @list = []
  end

  def store(a_journey)
    @list << a_journey
  end

  # def list
  #   @list.dup
  # end

  # def list
  #   list
  # end
  #
  # private


end
