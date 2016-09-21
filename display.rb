require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  attr_accessor :cursor

  @@displays = {
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
    system('clear')
    # puts @cursor.cursor_pos
    rendering = []
    @board.board.map.with_index do |row, i|
      row2 = []
      row.map.with_index do |pos, j|
        if pos.class != NullPiece
          str = @@displays[pos.piece]
          if pos.color == :white
            row2 << str.white
          elsif pos.color == :black
            row2 << str.red
          end
        else
          row2 << "   "
        end

        case i.even?
        when true
          row2[j] = row2[j].colorize(:background => :light_yellow) if j.even?
        when false
          row2[j] = row2[j].colorize(:background => :light_yellow) if j.odd?
        end

        case [i, j]
        when @cursor.cursor_pos
          row2[j] = row2[j].colorize(:background => :blue)
        end
      end
      rendering << row2.join("")
    end
    rendering.each { |row| puts row }
  end

end

board = Board.new
display = Display.new(board)
p board
display.render
display.cursor.get_input
display.render
