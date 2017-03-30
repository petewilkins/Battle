class Game

attr_reader :player_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @player_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player, option)
    player.got_attacked(option)
    @player_turn = player
  end
end
