
require './lib/station.rb'
require './lib/oystercard.rb'

card = Oystercard.new(JourneyLog.new(Journey))
card.top_up 2
heathrow = Station.new('Heathrow', 6)
aldgate = Station.new('Aldgate', 1)
card.touch_in aldgate
card.touch_out heathrow
card


brixton = Station.new('brixton', 2)
card.touch_out brixton
card

westminster = Station.new('Westminster', 1)
card.touch_in westminster
ealing = Station.new('Ealing', 5)
card.touch_in ealing
card

aldgate = Station.new('Aldgate', 1)
card.touch_in(aldgate)
card.touch_in(westminster)

card.touch_in(westminster)
card.touch_in(aldgate)
