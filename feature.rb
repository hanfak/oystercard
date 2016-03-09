require './lib/station.rb'
require './lib/oystercard.rb'

card = Oystercard.new
card.top_up 10
 heathrow = Station.new('Heathrow', 6)
 aldgate = Station.new('Aldgate', 1)
 card.touch_in(aldgate)
  card.touch_out heathrow
card

# push two copies of the same journey in journey log
