require_relative 'manifest'

class Board

  BOARD = Array.new(8) { Array.new(8) }

  attr_accessor :board

  def initialize(board = BOARD)
    @board = board
    populate
    @king_pos_black = [0, 4]
    @king_pos_white = [7, 4]
  end

  def end_row(color, row)
    @board[row][0] = Rook.new(color, [row, 0])
    @board[row][1] = Knight.new(color, [row, 1])
    @board[row][2] = Bishop.new(color, [row, 2])
    @board[row][3] = Queen.new(color, [row, 3])
    @board[row][4] = King.new(color, [row, 4])
    @board[row][5] = Bishop.new(color, [row, 5])
    @board[row][6] = Knight.new(color, [row, 6])
    @board[row][7] = Rook.new(color, [row, 7])
    #TODO: make sure queen is on her color
  end

  def populate
    @board[1].map!.with_index { |pos, i| pos = Pawn.new(:black, [1, i]) }
    @board[6].map!.with_index { |pos, i| pos = Pawn.new(:white, [6, i]) }
    end_row(:black, 0)
    end_row(:white, 7)

    the_singleton = NullPiece.instance
    @board.each_with_index do |row, i|
      row.each_with_index do |col, j|
        @board[i][j] = the_singleton if row[j].nil?
      end
    end
  end


  def move(start, end_pos)
    # raise error if .methodcall_invalid_move <= can piece be moved to end_pos and is there a piece at start
    #if start is a king, then update king_pos_color to end_pos
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def in_check?(color)
    p @king_pos_white
    color == :white ? self[@king_pos_white].in_checky? : self[@king_pos_black].in_checky?
  end

  def checkmate?(color)
    return false if in_check?(color) == false
    current_king = color == :white ? self[@king_pos_white] : self[@king_pos_black]
    possible_moves = current_king.moves
    case current_king.attacked_vectors.length
    when 2
      king_checkmate_helper(possible_moves, color)
    when 1
      return true if king_checkmate_helper(possible_moves, color) &&
        other_piece_checkmate_helper(color)
      #helper function - possible moves of other pieces and checkmate helper
    when 0
      raise "not in check, why am i here?"
    end
    false
  end

  def king_checkmate_helper(possible_moves, color)
    possible_moves.each do |move|
      board_copy = @board.deep_dup
      board_copy[current_king] = NullPiece.instance
      board_copy[move] = King.new(color, move)
      return false if !in_checky?(board_copy[move])
    end
  end

  def other_piece_checkmate_helper(color)
    own_pieces = find_same_color_positions(color)
    own_pieces.each do |piece|
      return piece.moves.none? {|move| @attacked_vectors[0].include?(move)}
    end
  end

  def find_same_color_positions(color)
    own_pieces = []

    @board.each_with_index do |row, i|
      row.each_with_index do |col, j|
        own_pieces << @board[i][j] if col.color == color && col.class != King
      end
    end

    own_pieces
  end

end

class Array
  def deep_dup
    self.map do |elem|
      elem.is_a?(Array) ? elem.deep_dup : elem
    end
  end
end
