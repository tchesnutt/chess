require_relative 'piece'

class Bishop < Piece
  include Slideable

  def initialize(color, piece = :bishop, pos)
    super(color, piece, pos)
    @piece = piece
  end

end
