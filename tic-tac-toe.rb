class Player
  def initialize(name)
    @name = name
    @turn = false
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
  end
  def display_board
    puts "#{@board[:top_left]} | #{@board[:top_middle]} | #{@board[:top_right]}"
    puts "#{@board[:middle_left]} | #{@board[:middle_middle]} | #{@board[:middle_right]}"
    puts "#{@board[:bottom_left]} | #{@board[:bottom_middle]} | #{@board[:bottom_right]}"
  end
end

jane = Player.new("Jane")
tom = Player.new("Tom")
game = TicTacToe.new(jane, tom) 

game.display_board