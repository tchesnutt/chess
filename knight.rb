require_relative 'piece'

class Knight < Piece

  def initialize(color, piece = :knight, pos)
    super(color, pos)
    @piece = piece
  end


end
