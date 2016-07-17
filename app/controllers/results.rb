get "/results" do
  @round = Round.find_by(id: session[:current_round])

  session[:current_round] = nil
  erb :'user/results'
end
