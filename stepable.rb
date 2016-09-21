require_relative 'piece'

module Stepable
  def valid_knight_moves(position)
    row, col = position
    possible_positions = [-2, -1, 1, 2]
    result = []
    possible_positions.each do |x|
      possible_positions.each do |y|
        next_possible_position = [row + x, col + y]
        result << next_possible_position if (y.abs != x.abs) && valid_positions(next_possible_position)
      end
    end
    result
  end

  def valid_king_moves
  end

  def valid_positions(position)
   position.each { |el| return false if el > 7 || el < 0 }
   true
  end

end
