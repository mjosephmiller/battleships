require './lib/game'
require './lib/player'
require 'sinatra/base'

class Battlemon < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turn
    erb :attack
  end

  get '/battle' do
    erb :battle
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
