require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    p params
    @player_1 = Player.new(params[:player_1_name])
    @player_2 = Player.new(params[:player_2_name])
    $game = Game.new(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack' do
    @game = $game
    $player_1_attack = params[:player_1_attack]
    @game.attack(@game.player_2, $player_1_attack)
    @game.switch_turns
    redirect '/fight'
  end

  get '/fight' do
    @game = $game
    @player_1_attack = $player_1_attack
    erb :fight
  end

    # start the server if ruby file executed directly
    run! if app_file == $0

end
