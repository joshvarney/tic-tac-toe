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
			@board_array = @board
			game_board << @board
			@board = @board[0..58]	 
	end 
	def game_board
	  	grid = ""
	    @board.each_with_index do |cell, index|
	    	grid << " #{@board[index]} "
	      	case index % 3
	      		when 0, 1 then grid << "|"
	      		when 2 then grid << "\n-----------\n" unless cell == 8
	    	end
	  	end
	  	@board = grid
	end
	attr_reader :board_array
	attr_reader :board	
end	


class Two_player
	def initialize
		start_board = nil
		stuff = Board.new(start_board)
		game_board = stuff.board
		@game_array = stuff.board_array
		puts " "
		puts game_board
		puts " "
		puts "Player 1 enter the number of the space you want to take:"
		move = gets.chomp.to_i
		system "cls"
		update_board(move)
	end
	def update_board(move)
		p1 = "X"
		p2 = "O"
		player = " "
		wrong_space = " "
		count = 0
		moves = move
		until count == 9
			counter = 0 	
			if @game_array.include?(moves) == true
				wrong_space = " "
				@game_array.each do |cell|
					if cell == moves
						if count.even? == true
							@game_array[counter] = p1
							count += 1
						else
							@game_array[counter] = p2
							count += 1
						end
					end
				counter += 1
				end	
			else
				wrong_space = "Try Again"	
			end
			if count.even? == true
				player = "Player 1"
			else
				player = "Player 2"
			end
			puts count			 		
			new_board = Board.new(@game_array)
			puts " "
			puts new_board.board
			puts "#{wrong_space}"
			puts "#{player} enter the number of the space you want to take:"	
			moves = gets.chomp.to_i
			system "cls"
		end
		puts "Tie"					
	end
end
class The_game
	def initialize
		puts "Select game type; 1 = PVP, 2 = Easy CPU, 3 = Medium CPU, 4 = Hard CPU"
		game_type = gets.chomp.to_i
		game_type
		system "cls"
			case game_type
				when game_type = 1
					Two_player.new
			end				
	end
end	
The_game.new




