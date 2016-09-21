require_relative 'piece'

class Bishop < Piece
  include Slidable

  def initialize(color, piece = :bishop, pos)
    super(color, pos)
    @piece = piece
  end

end
