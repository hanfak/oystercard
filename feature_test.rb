require './lib/oystercard.rb'

card = Oystercard.new

card.top_up(7)

card.balance

card.deduct(5)

card.touch_in('nikesh')

card.touch_out

card.journey
