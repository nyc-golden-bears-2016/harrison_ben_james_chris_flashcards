def current_card
  deck = Round.find(session[:current_round]).deck
  possible_cards = []
  deck.cards.each do |card|
    unfinished_card = true
    deck.rounds.find(session[:current_round]).guesses.each do |guess|
      if guess.answer == card.correct_answer
        unfinished_card = false
      end
    end
    if unfinished_card
      possible_cards << card
    end
  end
  if possible_cards.empty?
    return nil
  else
    return possible_cards.sample
  end
end
