get '/games' do
  session[:active_deck] = nil
  @games = Game.all

  erb :'games/show'

end

post '/games' do

  @game = Game.new(params[:game])
  session[:current_game] = @game.id
  if @game.save
    redirect "/deck/#{@game.deck_id}"
  else
    erb :'games/show'
  end

end

get '/deck/:id' do


  @deck = Deck.find(params[:id])
  if done?
    user = User.find(session[:id])
    user.games << current_game
    redirect '/games'
  end

  if !(session[:active_deck])
      session[:last_answer] = nil
      session[:active_deck] = @deck.id
      get_active_deck.cards.each do |card|
        card.answer_status = false
      end
  end

  loop do
    session[:current_card] = get_active_deck.cards.sample.id
    break if get_current_card.answer_status == false
  end


  erb :'games/questions'


end

put '/questions' do

  if get_current_card.answer == params[:answer]
    cur_card = get_current_card
    cur_card.answer_status = true
    session[:last_answer] = "CORRECT!"
    cur_card.guess.correct = true
    cur_card.guess.attempt += 1
    cur_card.save
  else
    session[:last_answer] = "INCORRECT!"
  end

  redirect "/deck/#{session[:active_deck]}"

end



