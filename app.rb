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
    $attack_method = params[:attack_method]
    @game.attack(@game.opponent, $attack_method)
    @game.switch_turns
    redirect '/fight'
  end

  get '/fight' do
    @game = $game
    @attack_method = $attack_method
    erb :fight
  end

    # start the server if ruby file executed directly
    run! if app_file == $0

end
