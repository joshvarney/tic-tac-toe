class Board
	def initialize(move)
		if move.class == Array 
			@board = move
		elsif	
			@board = Array.new(9)
			counter = 0
			@board.each do |cell|
				@board[counter] = counter
				counter += 1
			end
		end	
			game_board << @board
			@board = @board[0..58]	 
	end 
	def game_board
		output2 = @board
	  	output = ""
	    output2.each_with_index do |cell, index|
	    	output << " #{output2[index]} "
	      	case index % 3
	      		when 0, 1 then output << "|"
	      		when 2 then output << "\n-----------\n" unless cell == 8
	    	end
	  	end
	  	@board = output
	end
	attr_reader :board
end	

# things = Board.new([0, 1, "X", "O", 4, 5, 6, 7, 8])
# p things.board
# puts things.board
# puts "Enter number position for your move:"
# player_move = gets.chomp
# system "cls"
# player_move
player_turn = "X"
player_move = 4
board_array = [0, 1, "X", "O", 4, 5, 6, 7, 8]

class Two_player
	# attr_reader :board
	def initialize(player_turn, player_move, board_array)
		@turn = player_turn
		@move = player_move
		@new_board = board_array
		@new_board = update_board
		# things = Board.new([0, 1, "X", "O", 4, 5, 6, 7, 8])
		things = Board.new(update_board)
		p things.board
		puts things.board
		puts "Enter number position for your move:"
		@player_move = gets.chomp
		system "cls"
		p "done"
	end
	attr_accessor :turn
	attr_accessor :move
	attr_accessor :new_board
	def update_board
		counter = 0
		p @new_board.include?(@move)
		if @new_board.include?(@move) == true
			@new_board.each do |cell|
				p cell
				p @move
				if cell == @move
					@new_board[counter] = @turn
				end
				counter += 1
			end
		else
			puts "Try Again"	
		end	
		@new_board			
	end
	attr_reader :new_board
end
# other_stuff = Two_player.new(player_turn, player_move, board_array)
# p other_stuff.new_board





# class The_game
# 	initialize(game_type)
# 	@type = game_type
# 		case @type
# 			when @type == "PVP"
# 				Two_player.new
		





# class Sequential_class
# 	def initialize
#	end
# end
# class Random_class
# 	def initialize
# 	end
# end
# class Unbeatable_class
# 	def initialize
# 	end
# end

# class Player_choice
# 	def initialize
# 	end
# end
# class The_game
#	def initialize
#	end
# end	