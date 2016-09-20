require_relative 'piece'

module Slideable

  def moves(start_pos)
    possible_moves = []
    case self.symbol
    when :rook
      possible_moves + horizontal(start_pos)
    when :bishop
      possible_moves + diagonal(start_pos)
    when :queen
      possible_moves + diagonal(start_pos) + horizontal(start_pos)
    end
  end


  def horizontal(start_pos)
    directions = [[0,1], [1,0], [-1,0], [0,-1]]
    result = []
    directions.each do |direction|
      result + grow_unblocked_moves_in_dir(start_pos, dirction[0][0], direction[0][1])
    end
    result
  end

  def diagonal(start_pos)
    directions = [[1,1], [1,-1], [-1,1], [1,-1]]
    result = []
    directions.each do |direction|
      result + grow_unblocked_moves_in_dir(start_pos, dirction[0][0], direction[0][1])
    end
    result
  end
  private

  def grow_unblocked_moves_in_dir(start_pos, dx, dy)
    new_pos = [start_pos[0] + dx, start_pos[1] + dy]

    return [] if @board[new_pos].color == self.color
    return [] if [new_pos].out_of_bounds?
    return [new_pos] if @board[new_pos].color != self.color

    [new_pos] + grow_unblocked_moves_in_dir(new_pos, dx, dy)
  end

  def out_of_bounds?
    self.any? { |coordinate| coordinate > 7 || coordinate < 0 }
  end
end

class Rook < Piece
  include Slideable

  def initialize(color, piece = :rook, pos)
    super(color, piece, pos)
    @piece = piece
  end

end

class Bishop < Piece
  include Slideable

  def initialize(color, piece = :bishop, pos)
    super(color, piece, pos)
    @piece = piece
  end

end

class Queen < Piece
  include Slideable

  def initialize(color, piece = :queen, pos)
    super(color, piece, pos)
    @piece = piece
  end

end
