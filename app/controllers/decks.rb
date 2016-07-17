get '/decks' do
  session[:current_round] = nil
  if !session[:id]
    session.clear
  end
  erb :'deck/show'
end

get '/decks/:id' do
  deck = Deck.find_by(id: params[:id])
  if !(deck)
    halt(404, "Deck not found")
  end
  if !session[:current_round]
    new_round = Round.new({user_id: session[:id], deck_id: deck.id})
    new_round.save
    session[:current_round] = new_round.id
  end
  @card = current_card
  if @card
    erb :'deck/show_question'
  else
    session[:answer_status] = nil
    redirect "/results"
  end
end


put "/check_answer/:id" do
  card = Card.find(params[:id])
  session[:previous_card] = card.id
  guess = Guess.new({answer: params[:answer]})
  if params[:answer] == card.correct_answer
    session[:answer_status] = "CORRECT!"
  else
    session[:answer_status] = "INCORRECT! "
    session[:answer_status] << "Correct answer is: " << card.correct_answer
  end
  round = Round.find(session[:current_round])
  guess.round_id = round.id
  guess.card_id = card.id
  guess.save
  redirect "/decks/#{round.deck_id}"
end
