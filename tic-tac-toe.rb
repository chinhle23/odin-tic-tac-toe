class Player
  attr_accessor :mark
  attr_reader :name
  def initialize(name)
    @name = name
    @mark = ""
  end
end

class TicTacToe
  attr_accessor :board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = {
      top_left: "",
      top_middle: "",
      top_right: "",
      middle_left: "",
      middle_middle: "",
      middle_right: "",
      bottom_left: "",
      bottom_middle: "",
      bottom_right: ""
    }
    @turn = 1
  end
  def start_game
    who_goes_first
    display_board 
    whose_move
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
end

jane = Player.new("Jane")
tom = Player.new("Tom")
game = TicTacToe.new(jane, tom) 

p game.start_game