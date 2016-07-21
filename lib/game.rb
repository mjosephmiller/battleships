require_relative 'player'

class Game

attr_reader :current_turn, :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end


  def attack(player)
    deduct_hp(player)
  end

  def switch_turn
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_player)
    @players.select {|player| player != the_player}.first
  end

  private
  def deduct_hp(player)
    player.hit_points -= 10
  end


end
