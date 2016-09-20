class Knight < Piece

  def initialize(color, piece = :knight, pos)
    super(color, piece, pos)
    @piece = piece
  end


end
