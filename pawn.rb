require_relative 'piece'

class Pawn < Piece

  def initialize(color, pos, piece = :pawn)
    super(color, pos)
    @piece = piece
  end
end
