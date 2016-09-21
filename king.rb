require_relative 'piece'

class King < Piece
include Stepable
include Slidable

  def initialize(color, piece = :king, pos)
    super(color, pos)
    @piece = piece
    @attacked_vectors = []
  end

  def moves(start_pos = @pos)
    directions = [[0,1], [1,0], [-1,0], [0,-1], [1,1], [1,-1], [-1,1], [1,-1]]
    possible_moves = []
    directions.each_with_index do |val, i|
      new_pos = [start_pos[0] + val[0], start_pos[1] + val[1]]
      possible_moves << new_pos if @board[new_pos].class == NullPiece
    end
    possible_moves
  end

  def calculate_challenge_vectors(king_pos = @pos)
    horizontal_vectors = horizontal(king_pos)
    diagonal_vectors = diagonal(king_pos)
    knight_vectors = valid_knight_moves(king_pos)
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
    @attacked_vectors << knight_vectors.select do |sub_vector|
      @board[sub_vector].color != self.color && @board[sub_vector].piece == :knight
    end

    @attacked_vectors.delete([])
  end

  def in_checky?(possible_position = nil)
    possible_position ||= @pos
    clear_attack_vectors
    calculate_challenge_vectors(possible_position)
    return false if @attacked_vectors.empty?
    true
  end

  def clear_attack_vectors
    @attacked_vectors = []
  end

  private

end
