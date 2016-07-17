def correct_on_first(round)
  first_try_cards = round.deck.cards.to_a
  all_cards = first_try_cards
  round.guesses.each do |guess|
    all_cards.each do |card|
      if guess.card.id == card.id
        if guess.card.correct_answer != guess.answer
          first_try_cards.delete(guess.card)
        end
      end
    end
  end
  return first_try_cards.length
end
