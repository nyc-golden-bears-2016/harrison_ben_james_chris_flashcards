def get_active_deck
  Deck.find_by(id: session[:active_deck])
end

def done?
  answer = get_active_deck.cards.find do |card|
    card.answer_status == false
  end
  if answer.nil?
    return true
  else
    return false
  end
end
