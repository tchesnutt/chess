require_relative 'piece'

class Queen < Piece
  include Slidable

  def initialize(color, piece = :queen, pos)
    super(color, pos)
    @piece = piece
  end

end
