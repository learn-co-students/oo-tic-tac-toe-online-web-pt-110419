class TicTacToe
  @@instances = []
attr_accessor :name, :board

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top left to bottom right diagonal
  [2,4,6]  # Top right to bottom left diagonal
  ]
  def initialize
  
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  @@instances << self
end
  
def display_board
  row1 = [@board[0], @board[1], @board[2]] #abstraction of @board placeholders 0, 1 and 2 as row1
  row2 = [@board[3], @board[4], @board[5]] #abstraction of @board placeholders 3, 4 and 5 as row2
  row3 = [@board[6], @board[7], @board[8]] #abstraction of @board placeholders 6, 7 and 8 as row3
   
  row_1_display = " #{row1[0]} | #{row1[1]} | #{row1[2]} " #real world visual of row1 
  row_2_display = " #{row2[0]} | #{row2[1]} | #{row2[2]} " #real world visual of row2
  row_3_display = " #{row3[0]} | #{row3[1]} | #{row3[2]} " #real world visual of row3
  row_border = "-----------"                               #real world visual of border to separate board rows
   
   display_board = "#{row_1_display} \n#{row_border} \n#{row_2_display} \n#{row_border} \n#{row_3_display}" 
   #Final variable to hold visual representation of game state
   #We now have a real-world game board.
   puts display_board
  end
  
  #lets say:
  #input = gets.chomp has already been executed to retrieve string input from user
  #method - input_to_index retrieves string from #input and converts it to int with to_i 
  
  
  def input_to_index(input)
    index = (input.to_i) -1
end
#input_to_index method asks user where on the board he would like to move.  All this method does is change the state of the square from empty to an integer---the integer doesn't really matter.


def move(index, token = 'X')
    @board[index] = token 
end

def position_taken?(x = input_to_index(input).to_i)
  @board[x] == " " ? false  : true
end

def valid_move?(position)
  case position
    when 0..8
      @board[position] == " " ? true : false
    else puts "position is invalid"
      
  end
end
def turn
  puts "pick a square 1- 9.."
  input = gets.chomp
  index = (input.to_i) -1
  input_to_index(index)
  if valid_move?(index) == true
    move(index, current_player)
    display_board
  else turn
end
end

def turn_count
  occupied_positions = 0
  count = 2
  @board.each {|pos|
    if pos == " "
      count +=1
    end
  }
    occupied_positions =9 - (count- 2)
    occupied_positions
end
def current_player
  current_payer = "X"
  if turn_count % 2 == 0
      current_player = "X"
  else current_player = "O"
end
  current_player
end

def won?
  won = false
  winning_combo = []
  WIN_COMBINATIONS.each {|triplet|
   won = true && winning_combo = triplet  if   (board[triplet[0]] =='X' && board[triplet[1]] =='X' && board[triplet[2]] =='X') || (board[triplet[0]] =='O' && board[triplet[1]] =='O' && board[triplet[2]] =='O')
  }
  won == true ? triplet : won
end

def full?
  board_full = false
  board_full = true unless @board.any?{|pos| pos == " "}
  board_full
end

def draw?
  draw = nil
  draw = false if won? == true
  draw = false if full? == false
  draw = true if full? == true && won? == false
  draw
end

def over?
  draw? || won? ? true : false
end
def winner
winner = nil
WIN_COMBINATIONS.each {|triplet|
   winner = 'X' if   (board[triplet[0]] =='X' && board[triplet[1]] =='X' && board[triplet[2]] =='X')
   winner = 'O' if   (board[triplet[0]] =='O' && board[triplet[1]] =='O' && board[triplet[2]] =='O')
}
winner
end
def play
  until over? == true
  turn
  #puts "choose a square 1-9"
   # input = gets.chomp
    #index = input.to_i - 1
    #if valid_move?(index) == true
     # move(index, current_player)
      #display_board
    #end
end
if winner != nil
  if over?
    if current_player == 'X'
      puts "Congratulations O!"
    elsif current_player == 'O'
      puts "Congratulations X!"
    end
  end
else puts "Cat's Game!"
end
  end
end