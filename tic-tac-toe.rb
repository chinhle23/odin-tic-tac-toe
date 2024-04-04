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
      top_left: "_",
      top_middle: "_",
      top_right: "_",
      middle_left: "_",
      middle_middle: "_",
      middle_right: "_",
      bottom_left: "_",
      bottom_middle: "_",
      bottom_right: "_"
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
      end
    end
  end
  private
  attr_accessor :board
  def display_board
    puts "#{@board[:top_left]} | #{@board[:top_middle]} | #{@board[:top_right]}"
    puts "#{@board[:middle_left]} | #{@board[:middle_middle]} | #{@board[:middle_right]}"
    puts "#{@board[:bottom_left]} | #{@board[:bottom_middle]} | #{@board[:bottom_right]}"
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
      puts "select one of #{@open_spots}"
      begin
        move_location = gets.chomp.to_sym
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
    @board[:top_left] == mark &&
    @board[:top_left] == @board[:top_middle] && @board[:top_middle] == @board[:top_right]
  end 
  def middle_row_winner?(mark)
    @board[:middle_left] == mark &&
    @board[:middle_left] == @board[:middle_middle] &&
    @board[:middle_middle] == @board[:middle_right]
  end 
  def bottom_row_winner?(mark)
    @board[:bottom_left] == mark &&
    @board[:bottom_left] == @board[:bottom_middle] &&
    @board[:bottom_middle] == @board[:bottom_right]
  end
  def left_column_winner?(mark)
    @board[:top_left] == mark &&
    @board[:top_left] == @board[:middle_left] &&
    @board[:middle_left] == @board[:bottom_left]
  end
  def middle_column_winner?(mark)
    @board[:top_middle] == mark &&
    @board[:top_middle] == @board[:middle_middle] &&
    @board[:middle_middle] == @board[:bottom_middle]
  end
  def right_column_winner?(mark)
    @board[:top_right] == mark &&
    @board[:top_right] == @board[:middle_right] &&
    @board[:middle_right] == @board[:bottom_right]
  end
  def top_diagonal_winner?(mark)
    @board[:top_left] == mark &&
    @board[:top_left] == @board[:middle_middle] &&
    @board[:middle_middle] == @board[:bottom_right]
  end
  def bottom_diagonal_winner?(mark)
    @board[:bottom_left] == mark &&
    @board[:bottom_left] == @board[:middle_middle] &&
    @board[:middle_middle] == @board[:top_right]
  end
end

jane = Player.new("Jane")
tom = Player.new("Tom")
game = TicTacToe.new(jane, tom) 

p game.start_game