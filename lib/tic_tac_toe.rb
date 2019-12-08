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
    if position < 8 && position_taken?(position) == false
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
  input = gets
  input_integer = input_to_index(input)
  valid_move?(input_integer)
  current_player(input_integer)
  # binding.pry


  end

# Removing lines 98-100 will reveal the tests
# why don't lines 99&100 work? Is it because I didn't give the initialize method an argument?

end



# require 'pry'
# class TicTacToe
#
#
# WIN_COMBINATIONS =[
# [0, 1, 2],
# [3, 4, 5],
# [6, 7, 8],
# [0, 3, 6],
# [1, 4, 7],
# [2, 5, 8],
# [0, 4, 8],
# [6, 4, 2]
# ]
#
#   def initialize(board = nil)
#     # why does board need a default value of nil? there is no variance for a tic tac toe board
#     board = Array.new(9, ' ')
#     @board = board
#   end
#
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
#
#   def input_to_index(users_input)
#     # how do I record users input
#     users_input.to_i-1
#   end
#
#   def move(index_players_token, player_token = "X")
#     # how do I change elements within the array?
#
#     # @board[0] = "X"
#     # @board[4] = "O"
#     @board[index_players_token] = player_token
#   end
#
#   def position_taken?(users_desired_move)
#     # how do I check if position in array is taken?
#     # how do I examine elements in an array?
#     # how to check array to match argument?
#     if @board[users_desired_move] == " "
#       false
#     else
#       true
#     end
#   end
#
#   def valid_move?(position)
#     # what constitutes a valid move?
#     # a valid move has to be a number that exists on the board and the space has to be blank
#     if position < 10 && position_taken?(position) == false
#       true
#     else
#       false
#     end
#   end
#
#   def turn_count
#     # how many spots are empty in the array?
#     # how to check empty spots in an array?
#     @board.count("X") + @board.count("O")
#   end
#
#   def current_player
#     # x should always go first
#     # how do I reach turn 3?
#     # x is always odd
#     # o is always even
#     # if turn_count.even?
#     #   "O"
#     # else
#     #   "X"
#     # end
#
#     if turn_count % 2 == 0
#       "X"
#     else
#       "O"
#     end
#   end
#
#   def turn
# #ask for input
# # get input
# # translate input into index
# # if index is valid
# # make the move for index
# # show the board
# # else
# # ask for input again
# # end
#   input = gets
#   # input_integer = input_to_index(input)
#   # # binding.pry
#   # valid_move?(input_integer)
#   # current_player(input_integer)
#
#   end
#
#
#
# end
