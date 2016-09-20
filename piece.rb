class Piece

  attr_reader :piece, :color, :pos

  DISPLAYS = {
    :knight => " N ",
    :pawn => " p ",
    :queen => " Q ",
    :king => " K ",
    :bishop => " B ",
    :rook => " R "
  }

  def initialize(color, pos)
    @color = color
    # @piece = piece
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
