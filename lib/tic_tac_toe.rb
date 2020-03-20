require "pry"
class TicTacToe
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
    ]
  
  def initialize(board = nil) 
    @board = Array.new(9, " ")
  end
  
   def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
  
  def input_to_index(user_input)
    user_input.to_i - 1 
    
  end
  
  def move(index, player = "X")
    @board[index] = player

  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
    
  end


  def turn_count
  @board.count{|player| player == "X" || player == "O" }  
  end
  
 def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Player, please enter a number 1-9:"
    input = gets.strip
    index = input_to_index(input)
  
    if valid_move?(index)
      #binding.pry
      cp = current_player
      move(index, cp)
    else
      turn
    end
    display_board
  end
  
  def won?
    a = WIN_COMBINATIONS.find { |combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" }
    
    b = WIN_COMBINATIONS.find { |combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" }
    return a || b
  
  end
  
  
  def full? 
    !@board.any?{ |x| x=="" || x == " "}
  end 
  
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  
  def winner
    
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
      
  end
    
    def play 
      turn until over?
      won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
   
     end
  
end