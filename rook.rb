require_relative 'piece'

class Rook < Piece
  include Slideable

  def initialize(color, piece = :rook, pos)
    super(color, piece, pos)
    @piece = piece
  end

end
