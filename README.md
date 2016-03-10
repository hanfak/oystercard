Oystercard Challenge
=================
[![Build Status](https://travis-ci.org/eripheebs/oystercard.svg?branch=master)](https://travis-ci.org/eripheebs/oystercard)

Tree
---------
oystercard
- lib
	- journey.rb
	- journey_log.rb
	- oystercard.rb
	- station.rb
- spec
	- spec_helper.rb
	- journey_log_spec.rb
	- oystercard_spec.rb
	- station_spec.rb
- coverage
-.coveralls.yml
-.rspec
-.travis.yml
- Gemfile
- Gemfile.lock
- README.md
- Rakefile
- feature_test.rb

Installation Instructions
-----
- Fork the repo
- Clone the repo to your computer: git clone [repo url]
- Install bundle gem

What the project can do (with code examples)
-----
```
You can create a new oystercard:
card = Oystercard.new(JouneyLog, Journey)

You can create new stations:
holborn = Station.new(name: "Holborn", zone: 1)

You can top up (up to the maximum amount):
card.top_up(5)

You can touch in to a staton:
card.touch_in(holborn)

You can touch out of a station:
card.touch_out(queensway)

The fare of a journey will be deducted from your balance, with added cost of crossing zones.

You will be fined a penalty fare if you touch in or touch out twice in a row.

You will receive error messages if you try touch in with too little money.

Your journeys will be logged.
```

Authors
-----
Erika Pheby
- Day 1 partner: Nick Mountjoy
- Day 2 partner: Lorenzo Turrino
- Day 3 partner: Yasmin Green
- Day 4 partner: Tobenna Ndu
