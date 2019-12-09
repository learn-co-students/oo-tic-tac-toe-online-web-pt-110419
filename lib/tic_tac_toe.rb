require 'pry'
class TicTacToe


WIN_COMBINATIONS =[
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[6, 4, 2]
]

  def initialize
    @board = Array.new(9, ' ')
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(users_input)
    users_input.to_i-1
  end

  def move(index_players_token, player_token = "X")
    @board[index_players_token] = player_token
  end

  def position_taken?(users_desired_move)
    if @board[users_desired_move] == " "
      false
    else
      true
    end
  end

  def valid_move?(position)
    if position.between?(0,8) && position_taken?(position) == false
      true
    else
      false
    end
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
  input = gets.chomp
  input_integer = input_to_index(input)
    if valid_move?(input_integer)
    players_move = current_player
    move(input_integer, players_move)
    display_board
    else
      turn
    end
  end

  def won?
    win_combo = nil
    WIN_COMBINATIONS.each do |n|
      win_combo = n
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return win_combo
      elsif
        @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          return win_combo
      end
    end
    nil
  end

  def full?
    @board.all?{|occupied| occupied != " "}
  end

   def draw?
      if won?
        return false
      elsif
        full?
        return true
      else
        false
      end
   end

   def over?
     if won? || full?
       true
     end
   end

   def winner
     if won?
      @board[won?[0]]
      #  binding.pry
     end
    #  if turn_count % 2 == 0
    #    "O"
    #  else
    #    "X"
    #  end
    # if won? || full?
    #   end
   end

   def play
     while !over? && !draw?
      #  why doesn't over? == false && draw? == false work?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end

   end

end
