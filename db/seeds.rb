test_deck = Deck.new({title: "Test"})
5.times do |card|
  test_deck.cards << Card.new({question: "Answer is #{card}", correct_answer: "#{card}"})
end

test_deck.save

test_deck = Deck.new({title: "Test02"})
5.times do |card|
  test_deck.cards << Card.new({question: "Answer is #{card}", correct_answer: "#{card}"})
end

test_deck.save
