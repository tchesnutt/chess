require_relative 'piece'

class Pawn < Piece

  def initialize(color, pos, piece = :pawn)
    super(color, pos)
    @piece = piece
  end

  def moves
    if self.color == :black
      attacking_directions = [[-1, 1], [1, 1]]
      forward_dir = [0,1]
    else
      attacking_directions = [[-1, -1], [-1, 1]]
      forward_dir = [0,-1]
    end
    forward_position = forward_dir.map {|diff| [@pos[0] + diff[0], @pos[1] + diff[1]] }
    attacked_positions = attacking_directions.map { |diff| [@pos[0] + diff[0], @pos[1] + diff[1]] }
    valid_moves = []
    valid_moves << forward_position if @board[forward_position].class == NullPiece
    attacked_positions.each do |position|
      valid_moves << position if @board[forward_position].class != NullPiece &&
        @board[forward_position].color != self.color
    end
    valid_moves
  end

end
