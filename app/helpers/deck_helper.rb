def get_active_deck
  Deck.find_by(id: session[:active_deck])
end

def get_current_card
  Card.find_by(id: session[:current_card])
end

def done?
  if !get_active_deck
    return false
  end
  answer = get_active_deck.cards.find do |card|
    card.answer_status == false
  end
  if answer.nil?
    return true
  else
    return false
  end
end
