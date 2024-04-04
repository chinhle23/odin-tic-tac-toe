class Player
  attr_accessor :mark
  attr_reader :name
  def initialize(name)
    @name = name
    @mark = ""
  end
  protected

end

class TicTacToe
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = {
      11=> "_", 12=> "_", 13=> "_",
      21=> "_", 22=> "_", 23=> "_",
      31=> "_", 32=> "_", 33=> "_"
    }
    @open_spots = []
    @board.each do |key, value|
      @open_spots.push(key) if value == "_"
    end
    @turn = 1
  end
  def start_game
    who_goes_first
    display_board
    while 1
      whose_move
      player_move
      display_board
      if winner?(@player1.mark) 
        return "#{@player1.name}(#{@player1.mark}) wins!"
      elsif winner?(@player2.mark)
        return "#{@player2.name}(#{@player2.mark}) wins!"
      elsif @open_spots.empty?
        return "Game over. It's a draw!"
      end
    end
  end
  private
  attr_accessor :board
  def display_board
    puts "#{@board[11]} | #{@board[12]} | #{@board[13]}"
    puts "#{@board[21]} | #{@board[22]} | #{@board[23]}"
    puts "#{@board[31]} | #{@board[32]} | #{@board[33]}"
  end
  def who_goes_first
    player = rand(1..2)
    if player == 1
      @player1.mark = 'X'
      @player2.mark = 'O'
      @turn = 1
      puts "#{@player1.name} goes first and is 'X'"
    else 
      @player2.mark = 'X'
      @player1.mark = 'O'
      @turn = 2
      puts "#{@player2.name} goes first and is 'X'"
    end
  end
  def whose_move
    puts @turn == 1 ? "#{@player1.name}(#{@player1.mark}), your move" : 
                      "#{@player2.name}(#{@player2.mark}), your move"
  end
  def player_move
    while 1
      puts "Select a row-column to place your move, available spots: #{@open_spots}"
      begin
        move_location = gets.chomp.to_i 
        raise if !@open_spots.include?(move_location)
      rescue
        puts "Invalid input! Try again..."
      else
        @board[move_location] = @turn == 1 ? @player1.mark : @player2.mark
        @open_spots.delete(move_location)
        @turn = @turn == 1 ? 2 : 1
        break
      end
    end
  end 
  def winner?(mark)
    top_row_winner?(mark) ||
    middle_row_winner?(mark) ||
    bottom_row_winner?(mark) ||
    left_column_winner?(mark) ||
    middle_column_winner?(mark) ||
    right_column_winner?(mark) ||
    top_diagonal_winner?(mark) ||
    bottom_diagonal_winner?(mark)
  end 
  def top_row_winner?(mark)
    @board[11] == mark &&
    @board[11] == @board[12] && @board[12] == @board[13]
  end 
  def middle_row_winner?(mark)
    @board[21] == mark &&
    @board[21] == @board[22] &&
    @board[22] == @board[23]
  end 
  def bottom_row_winner?(mark)
    @board[31] == mark &&
    @board[31] == @board[32] &&
    @board[32] == @board[33]
  end
  def left_column_winner?(mark)
    @board[11] == mark &&
    @board[11] == @board[21] &&
    @board[21] == @board[31]
  end
  def middle_column_winner?(mark)
    @board[12] == mark &&
    @board[12] == @board[22] &&
    @board[22] == @board[32]
  end
  def right_column_winner?(mark)
    @board[13] == mark &&
    @board[13] == @board[23] &&
    @board[23] == @board[33]
  end
  def top_diagonal_winner?(mark)
    @board[11] == mark &&
    @board[11] == @board[22] &&
    @board[22] == @board[33]
  end
  def bottom_diagonal_winner?(mark)
    @board[31] == mark &&
    @board[31] == @board[22] &&
    @board[22] == @board[13]
  end
end

jane = Player.new("Jane")
tom = Player.new("Tom")
game = TicTacToe.new(jane, tom) 

p game.start_game