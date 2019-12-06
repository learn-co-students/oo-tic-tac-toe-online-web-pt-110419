
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

   def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

#IS # CORRECT & SPACE EMPTY?
def valid_move?(index)

  if index.between?(0,8) && !position_taken?(index)
      puts 'this is a valid move'
    return true
  else
   return false
  end
end

  def input_to_index(move)
    index = move.to_i - 1
    index
  end

  def move(index, token = "X")
  @board[index] = token
end

def turn
  puts " Player #{@current_player}, Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  cp = current_player
  if valid_move?(index)
    move(index,cp)
    display_board
  else
    turn
  end
end

def won?
  a = WIN_COMBINATIONS.find{
    |combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
  }

  b = WIN_COMBINATIONS.find{
    |combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
  }
  return a || b
end



def check_win_combination?(player, win_combo)
  win_combo.all? do |position|
    @board[position] == player
  end
end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def full?
  if @board.include?(' ') || @board.include?('')
    return false
else
    return true
  end
end

def draw?
  if !won? && full?
    return true
  end
  end

def over?
  if draw? || won?
    return true
  else
    false
  end
end

def winner
  if !won?
    return nil
  else WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?('X', win_combo)
      return 'X'
    elsif check_win_combination?('O', win_combo)
      return 'O'
    end
  end
end
end

def play
  until over?
  turn
end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
