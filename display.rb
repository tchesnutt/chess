class Display
  require 'colorize'
  require_relative 'cursor'
  require_relative 'board'

  attr_accessor :cursor

  DISPLAYS = {
    :knight => " N ",
    :pawn => " p ",
    :queen => " Q ",
    :king => " K ",
    :bishop => " B ",
    :rook => " R "
  }

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    # system('clear')
    puts @cursor.cursor_pos
    rendering = @board.board.map.with_index do |row, i|
      row2 = row.map.with_index do |pos, j|
        case [i, j]
        when @cursor.cursor_pos
          pos = " X "
          pos.colorize(:background => :red)
        else
          pos = "__"
        end
      end

      str = ""
      row2.each do |val|
        str << val
      end
      puts str

    end
    # puts rendering.each
    # {|row| puts "#{row}\n"}
  end

  # def render00
  #   # @board.board[0][0] = " X "
  #   @board.board[0][0].colorize(:background => :red)
  #   p @board
  # end
end

board = Display.new(Board.new)
board.render
board.cursor.get_input
board.render