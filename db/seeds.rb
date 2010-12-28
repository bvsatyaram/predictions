prediction_descriptions = [
  "will loose a tooth in a fight with a begger!",
  "will win the chain smoking marathon 2011!",
  "will have a new lover by Feb 14, 2011!"
]

puts "*** Cleaning up Predictions"
Prediction.destroy_all

puts "*** Seeding Predictions"
prediction_descriptions.each do |description|
  Prediction.find_or_create_by_description(description)
  puts "  * #{description}"
end