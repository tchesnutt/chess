class Piece
  require_relative 'board'

  DISPLAYS = {
    :knight => " N ",
    :pawn => " p ",
    :queen => " Q ",
    :king => " K ",
    :bishop => " B ",
    :rook => " R "
  }

  def initialize(color, piece, pos)
    @color = color
    @piece = peice
    @pos = pos
  end

  def to_s
    str = DISPLAYS[self.symbol]
    self.color == :white ? str.colorize(:white) : str.colorize(:gray)
  end

  def valid_moves()

  end

  def empty?
    #whatever
  end

end
