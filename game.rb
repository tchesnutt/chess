require_relative 'board'
require_relative 'players'
require_relative 'display'

class Game

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @display = Display.new(board)

    @current_player = player1
      # @current_player.color = :white
    @next_player = player2
      # @next_player.color = :black
  end

  def play
    @display.render
    until @board.checkmate?(@current_player.color)
      @display.render
      @current_player.play_turn
      switch_player
    end
  end

  def switch_player
    @current_player, @next_player = @next_player, @current_player
  end

end


Game.new(Player.new("one", :white), Player.new("two", :black), Board.new).play
