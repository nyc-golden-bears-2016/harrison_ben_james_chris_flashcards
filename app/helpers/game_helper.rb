def current_game
  Game.find_by(id: session[:current_game])
end
