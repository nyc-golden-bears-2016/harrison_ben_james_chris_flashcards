get '/games' do

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
  @card = @deck.cards.sample

  erb :'games/questions'

end
