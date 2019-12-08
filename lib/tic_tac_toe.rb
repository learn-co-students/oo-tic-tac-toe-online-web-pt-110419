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
    # how do I record users input
    users_input.to_i-1
  end

  def move(index_players_token, player_token = "X")
    # how do I change elements within the array?

    # @board[0] = "X"
    # @board[4] = "O"
    @board[index_players_token] = player_token
  end

  def position_taken?(users_desired_move)
    # how do I check if position in array is taken?
    # how do I examine elements in an array?
    # how to check array to match argument?
    if @board[users_desired_move] == " "
      false
    else
      true
    end
  end

  def valid_move?(position)
    # what constitutes a valid move?
    # a valid move has to be a number that exists on the board and the space has to be blank
    # how do I account for negative numbers? how can I find an exact range?
    if position.between?(0,9) && position_taken?(position) == false
      true
    else
      false
    end
  end

  def turn_count
    # how many spots are empty in the array?
    # how to check empty spots in an array?
    @board.count("X") + @board.count("O")
  end

  def current_player
    # x should always go first
    # how do I reach turn 3?
    # x is always odd
    # o is always even
    # if turn_count.even?
    #   "O"
    # else
    #   "X"
    # end
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
#ask for input
# get input
# translate input into index
# if index is valid
# make the move for index
# show the board
# else
# ask for input again
# end
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
end
