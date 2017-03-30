require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    p params
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_2_fame_points = $player_2.fp
    erb :play
  end

  post '/attack' do
    @game = Game.new($player_1, $player_2)
    $player_1_attack = params[:player_1_attack]
    @game.attack($player_2, $player_1_attack)
    redirect '/fight'
  end

  get '/fight' do
    @player_1_attack = $player_1_attack
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_2_fame_points = $player_2.fp
    erb :fight
  end

    # start the server if ruby file executed directly
    run! if app_file == $0

end
