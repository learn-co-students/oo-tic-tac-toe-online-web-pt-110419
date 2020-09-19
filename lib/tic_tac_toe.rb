require 'pry'

class TicTacToe

attr_accessor :board

WIN_COMBINATIONS = [
[0,1,2], #top row
[3,4,5], #middle row
[6,7,8], #bottom row
[0,3,6], #left column
[1,4,7], #middle column
[2,5,8], #right column
[0,4,8], #ul to br diagonal
[2,4,6]  #ur to bl diagonal
]

def initialize()
@board = [" "," "," "," "," "," "," "," "," "]
end

def display_board()
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
input.to_i - 1
end

def move(position,player)
@board[position] = player
end

def position_taken?(position)
@board[position] == " " ? false : true
end

def valid_move?(position)
position > -1 && position < 9 && !self.position_taken?(position) ? true : false
end

def turn_count()
9 - @board.count(" ")
end

def current_player()
self.turn_count().even? ? "X" : "O"
end

def turn()
position = gets.chomp
puts "Choose a space (1 to 9): #{position}"
position = self.input_to_index(position)
if self.valid_move?(position)
self.move(position,self.current_player())
self.display_board()
else
"invalid"
self.turn()
end
end

def won?()
x_positions = @board.each_index.select { |i| @board[i] == "X"}
x_count = WIN_COMBINATIONS.map { |i| x_positions - i}.map{ |i| i.count}
x_check = x_count.each_index.select { |i| x_count[i] == x_positions.count - 3}
o_positions = @board.each_index.select { |i| @board[i] == "O"}
o_count = WIN_COMBINATIONS.map { |i| o_positions - i}.map{ |i| i.count}
o_check = o_count.each_index.select { |i| o_count[i] == o_positions.count - 3}

if x_check != []
WIN_COMBINATIONS[x_check[0]]
elsif o_check != []
WIN_COMBINATIONS[o_check[0]]
else
false
end
end

def full?()
@board.include?(" ") || self.won?() ? false : true
end

def draw?()
self.full?() && !self.won?() ? true : false
end

def over?()
self.draw?() || self.won?() ? true : false
end

def winner()
self.won?() == false ? nil : @board[self.won?().first.to_i]
end

def play()
puts "Welcome to Tic Tac Toe!"
puts "Press ENTER to start."
while self.over?() == false do
self.turn()
end

puts "Congratulations #{self.winner}!" if self.won? != false
puts "Cat's Game!" if self.draw?()
end

end