require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack_library'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    p params
    @player_1 = Player.new(params[:player_1_name])
    @player_2 = Player.new(params[:player_2_name])
    @game = Game.create(@player_1, @player_2)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    @attack_method = AttackLibrary.create(params[:attack_method])
    @game.attack(@game.opponent, @attack_method)
    @game.switch_turns
    redirect '/fight'
  end

  before do
    @attack_method = AttackLibrary.instance
  end

  get '/fight' do
    @attack_method = @attack_method.move
    erb :fight
  end

    # start the server if ruby file executed directly
    run! if app_file == $0
end
