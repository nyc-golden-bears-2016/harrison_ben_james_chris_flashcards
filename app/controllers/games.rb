get '/games' do

  @games = Game.all

  erb :'games/show'

end

post '/games' do
  # binding.pry
  @game = Game.new(params[:game])

  if @game.save
    redirect '/card/:id'
  else
    erb :'games/show'
  end

end

get '/card' do

  @question = Card.find_by(params[:deck_id])

  erb :'question/show'

end
#
# post '/question' do
#
  # below works with properly formatted params in HTML form
  # @question = Question.new(params[:question]) #create new question
#
  # if @question.save #saves new question or returns false if unsuccessful
    # redirect '/question' #redirect back to question index page
  # else
    # erb :'question/new' # show new question view again(potentially displaying errors)
  # end
#
# end
#
#
#
#
# get '/results' do
#
  # @results = Result.all
#
  # erb :'results/index'
#
# end

