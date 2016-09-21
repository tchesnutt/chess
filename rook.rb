require_relative 'piece'

class Rook < Piece
  include Slidable

  def initialize(color, piece = :rook, pos)
    super(color, pos)
    @piece = piece
  end

end
