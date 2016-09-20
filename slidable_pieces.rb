module Slideable

  def moves(start_pos)
    possible_moves = []
    case self.symbol
    when :rook || :queen
      possible_moves + horizontal(start_pos)
    when :bishop || :queen
      possible_moves + diagonal(start_pos)
    end
  end


  private

  def horizontal
    directions = [[0,1], [1,0], [-1,0], [0,-1]]
    result = []
    directions.each do |direction|
      result + grow_unblocked_moves_in_dir(start_pos, dirction[0][0], direction[0][1])
    end
    result
  end

  def diagonal
    directions = [[1,1], [1,-1], [-1,1], [1,-1]]
    result = []
    directions.each do |direction|
      result + grow_unblocked_moves_in_dir(start_pos, dirction[0][0], direction[0][1])
    end
    result
  end

  def grow_unblocked_moves_in_dir(start_pos, dx, dy)
    new_pos = [start_pos[0] + dx, start_pos[1] + dy]

    return [] if @board[new_pos].color == self.color
    return [new_pos] if @board[new_pos].class != NullPiece
    [new_pos] + grow_unblocked_moves_in_dir(new_pos, dx, dy)
  end

end

class Rook < Piece
  include Slideable

  def initialize(color, piece, pos)
    super(color, piece, pos)
    @symbol = :rook
  end

end

class Bishop < Piece
  include Slideable

  def initialize(color, piece, pos)
    super(color, piece, pos)
    @symbol = :bishop
  end

end

class Queen < Piece
  include Slideable

  def initialize(color, piece, pos)
    super(color, piece, pos)
    @symbol = :queen
  end

end
