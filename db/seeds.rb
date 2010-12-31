prediction_descriptions = [
  "will loose a tooth in a fight with a begger",
  "will win the chain smoking marathon 2011",
  "will have a new lover by Feb 14, 2011",
  ", along with four others, will be hospitalized for eating stuff cooked by you",
  "will be responsible for the death of a dozen of your peers, the weapon being your song",
  "will scream looking at some thing, later realizing that it was your own reflection",
  "will scream looking at some thing, later realizing that it was your lover",
  "will be responsible for cracking 100 mirrors",
  "will witness a gay marriage",
  "will drink 723986 ml of water in 2011",
  "will eat of 208456 grams of food in 2011",
  "will realize that 37% of all the food you ate in 2011 was junk!",
  "will talk for 2395874 seconds on phone in 2011",
  "will bath 26 times in 2011",
  "will love monkeys more than humans in 2011",
  "will finish a 100 meter running race in a record time of 3 hours 27 mins and 32 seconds",
  "will author a book in house keeping"
]

puts "*** Cleaning up Predictions"
Prediction.destroy_all

puts "*** Seeding Predictions"
prediction_descriptions.each do |description|
  Prediction.find_or_create_by_description(description)
  puts "  * #{description}"
end