get '/games' do
  session[:active_deck] = nil
  @games = Game.all

  erb :'games/show'

end

post '/games' do
  # binding.pry
  @game = Game.new(params[:game])

  if @game.save
    redirect "/deck/#{@game.deck_id}"
  else
    erb :'games/show'
  end

end

get '/deck/:id' do
  @deck = Deck.find(params[:id])
  if done?
    redirect '/'
  end

  if !(session[:active_deck])
      session[:last_answer] = nil
      session[:active_deck] = @deck.id
  end

  loop do
    session[:current_card] = get_active_deck.cards.sample
    break if session[:current_card].answer_status == false
  end

  erb :'games/questions'


end

put '/questions' do
  if get_active_deck.answer == params[:answer]
    session[:active_deck].delete(session[:current_card])
    session[:current_card].answer_status = true
    session[:last_answer] = "CORRECT!"
    session[:current_card].save
  else
    session[:last_answer] = "INCORRECT!"
  end

  redirect "/deck/#{session[:active_deck]}"

end



