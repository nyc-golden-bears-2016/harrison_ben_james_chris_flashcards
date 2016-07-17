def current_card
  deck = Round.find(session[:current_round]).deck
  possible_cards = []
  deck.cards.each do |card|
    unfinished_card = true
    deck.rounds.find(session[:current_round]).guesses.each do |guess|
      if guess.card.id == card.id
        if guess.answer == card.correct_answer
          unfinished_card = false
        end
      end
    end
    if unfinished_card
      possible_cards << card
    end
  end
  if possible_cards.empty?
    return nil
  else
    loop do
      cur_card = possible_cards.sample
      if (possible_cards.length == 1) || (cur_card.id != session[:previous_card])
        return cur_card
      end
    end
  end
end
