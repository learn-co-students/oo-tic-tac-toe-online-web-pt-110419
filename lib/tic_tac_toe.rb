class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #First column
    [1,4,7], #Second column
    [2,5,8], #Third column
    [0,4,8], #First diagonal
    [2,4,6] #Second diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i
    index -= 1
    index
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    self.position_taken?(index) == false && index > -1 && index < 10 ? true : false
  end

  def turn
    input = gets.chomp
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, current_player)
      self.display_board
    else
      self.turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each{|x|
      if @board[x[0]] == @board[x[1]] && @board[x[1]] == @board[x[2]] && @board[x[0]] != " "
        return x
      end
    }
    false
  end

  def full?
    if self.turn_count == 9
      return true
    end
    false
  end

  def draw?
    if self.full? == true && self.won? == false
      return true
    end
    false
  end

  def over?
    if self.full? == true || self.won? == true
      return true
    end
    false
  end

  def winner
    self.won? == false ? nil : @board[self.won?[0]]
  end

  def play
    self.display_board
    until self.over? || self.draw? || self.won? do
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end



end
