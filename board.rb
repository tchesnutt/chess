require_relative 'manifest'

class Board


  BOARD = Array.new(8) { Array.new(8) }

  attr_accessor :board

  def initialize(board = BOARD)
    @board = board
    populate
  end
  def end_row(color, row)
    self[0] = Rook.new(color, [row, 0])
    self[1] = Knight.new(color, [row, 1])
    self[2] = Bishop.new(color, [row, 2])
    self[3] = Queen.new(color, [row, 3])
    self[4] = King.new(color, [row, 4])
    self[5] = Bishop.new(color, [row, 5])
    self[6] = Knight.new(color, [row, 6])
    self[7] = Rook.new(color, [row, 7])
    #TODO: make sure queen is on her color
  end

  def populate
    @board[1].each { |pos| pos = Pawn.new(:black, [1, pos]) }
    @board[6].each { |pos| pos = Pawn.new(:white, [6, pos]) }
    @board[0].end_row(:black, 0)
    @board[7].end_row(:white, 7)
  end


  def move(start, end_pos)
    # raise error if .methodcall_invalid_move <= can piece be moved to end_pos and is there a piece at start
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def in_check?(color)
  end

end
