WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6]]
 
 #display an empty board
 def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# convert input number to integer: [0] = 1
def input_to_index(user_input)
  user_input.to_i - 1
end

#player enter number 
def move(board, index, current_player)
  board[index] = current_player
  end
  
  #check for empty space
def position_taken?(board, index)
    board[index] == "X" || board[index] == "O"
  end
  
  # only 0-8 valid to empty space
def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end
  
  #request input
  def turn(board)
  puts 'Please enter 1-9:'
  
  #gets player's input and stop blank line
  user_input = gets.strip
  index = input_to_index(user_input)
  
  #check for validation, update and display board
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
 end
    display_board(board)
end  

#counter 9 times display board
    def turn_count(board)
  board.count {|token| token == "X" || token == "O"}
 end
      #determine which player 
     def current_player(board) 
      turn_count(board).even? ? "X" : "O"
    end
    
    #who won? find winning_combo
    def won?(board)
      WIN_COMBINATIONS.detect do |combo|
        board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[0])
      end
    end
    
    #check if board is full
    def full?(board)
      if board.include?(" ") || board.include?("")
        false
      else
        true
end
end
       #draw if no wins and full board
       def draw?(board)
         !won?(board) && full?(board)
         end
       
       # start over if someone won and full board
       def over?(board)
         won?(board) || full?(board)
       end
      
      #check which player match with winning_combo 
       def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

# keep looping until winning or full board
   def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
  
    
    
    
    
    
  