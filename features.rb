
require './lib/station.rb'
require './lib/oystercard.rb'

card = Oystercard.new
card.top_up 10
heathrow = Station.new('Heathrow', 1)
aldgate = Station.new('Aldgate', 5)
card.touch_in(aldgate)
card.touch_out heathrow
card.balance


brixton = Station.new('brixton', 2)
card.touch_out brixton

westminster = Station.new('Westminster', 1)
card.touch_in westminster
ealing = Station.new('Ealing', 5)
card.touch_out ealing
card

aldgate = Station.new('Aldgate', 1)
card.touch_in(aldgate)
card.touch_in(heathrow)
