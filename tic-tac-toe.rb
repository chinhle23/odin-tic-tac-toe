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
  attr_accessor :board
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
    @turn = 1
  end
  def start_game
    who_goes_first
    display_board 
    whose_move
    player_move
    display_board
  end
  private
  def display_board
    puts "#{@board[:top_left]} | #{@board[:top_middle]} | #{@board[:top_right]}"
    puts "#{@board[:middle_left]} | #{@board[:middle_middle]} | #{@board[:middle_right]}"
    puts "#{@board[:bottom_left]} | #{@board[:bottom_middle]} | #{@board[:bottom_right]}"
  end
  def who_goes_first
    player = rand(1..2)
    if player == 1
      @player1.mark = 'X'
      @turn = 1
      puts "#{@player1.name} goes first and is 'X'"
    else 
      @player2.mark = 'X'
      @turn = 2
      puts "#{@player2.name} goes first and is 'X'"
    end
  end
  def whose_move
    puts @turn == 1 ? "#{@player1.name}, your move" : "#{@player2.name}, your move"
  end
  def player_move
    @board.each do |key, value|
      @open_spots.push(key) if value == "_"
    end
    while 1
      puts "select one of #{@open_spots}"
      begin
        move_location = gets.chomp.to_sym
        p move_location
        raise if !@open_spots.include?(move_location)
      rescue
        puts "Invalid input! Try again..."
      else
        @board[move_location] = @turn == 1 ? "X" : "O"
        break
      end
    end
  end  
end

jane = Player.new("Jane")
tom = Player.new("Tom")
game = TicTacToe.new(jane, tom) 

p game.start_game