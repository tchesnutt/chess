require_relative 'piece'

module Stepable
end

class King < Piece
include Stepable
include Slidable

  def initialize(color, piece = :king, pos)
    super(color, piece, pos)
    @piece = piece
    @attacked_vectors = []
    @knight_challenged = false
  end

  def in_check?(king_pos = @pos)
    horizontal_vectors = horizontal(king_pos)
    diagonal_vectors = diagonal(king_pos)
    #Assumption: make sure diagonal and horizontal_vectors are [[]] not []
    @attacked_vectors << horizontal_vectors.select do |sub_vector|
      #Assumption: we assume grow_unblocked_moves_in_dir grabs last peice if peice.color is differnet than start_pos.color
      last_pos = @board[sub_vector[-1]]
      last_pos.color != self.color &&
        (last_pos.piece == :rook || last_pos.piece == :queen)
    end
    @attacked_vectors << diagonal.select do |sub_vector|
      last_pos = @board[sub_vector[-1]]
      last_pos.color != self.color &&
        (last_pos.piece == :bishop || last_pos.piece == :queen)
    end
    #TODO: is king_pos challenged by knight?
    #TODO: Is attacked_vectors.length==0 and knight_challenged is false
  end

  private

end

class Knight < Piece

  def initialize(color, piece = :knight, pos)
    super(color, piece, pos)
    @piece = piece
  end


end
