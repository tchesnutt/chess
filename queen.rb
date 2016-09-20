require_relative 'piece'

class Queen < Piece
  include Slideable

  def initialize(color, piece = :queen, pos)
    super(color, piece, pos)
    @piece = piece
  end

end
