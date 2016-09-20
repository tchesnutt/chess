class Board

  BOARD = Array.new(8) { Array.new(8) }

  attr_accessor :board

  def initialize(board = BOARD)
    @board = board
  end

  def move(start, end_pos)
    # raise error if .methodcall_invalid_move <= can piece be moved to end_pos and is there a piece at start
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

end
