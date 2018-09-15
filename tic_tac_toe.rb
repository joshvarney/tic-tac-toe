class Board
	def initialize(move)
		if move.class == Array 
			@board = move[0..9]
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
class Winning
	def initialize(game_array)
		game_array = game_array
		@check_win = winning_combos(game_array)
		@check_win
	end
	def winning_combos(check_win)
		@check_win = check_win
			if @check_win[0..2].uniq.length == 1
				@check_win[9] = "Winner Top Row"
			elsif @check_win[3..5].uniq.length == 1
				@check_win[9] = "Winner Middle Row"
			elsif @check_win[6..8].uniq.length == 1	
				@check_win[9] = "Winner Bottom Row"
			elsif @check_win[0] == @check_win[3] && @check_win[0] == @check_win[6]
				@check_win[9] = "Winner Left Column"
			elsif @check_win[1] == @check_win[4] && @check_win[1] == @check_win[7]
				@check_win[9] = "Winner Middle Column"
			elsif @check_win[2] == @check_win[5] && @check_win[2] == @check_win[8]
				@check_win[9] = "Winner Right Column"
			elsif @check_win[0] == @check_win[4] && @check_win[0] == @check_win[8]
				@check_win[9] = "Winner Diagonal Left to Right"
			elsif @check_win[2] == @check_win[4] && @check_win[2] == @check_win[6]
				@check_win[9] = "Winner Diagonal Right to Left"				
			end
		@check_win	
	end
	@check_win
	attr_reader :check_win		
end
class Two_player
	def initialize
		start_board = nil
		stuff = Board.new(start_board)
		game_board = stuff.board
		@game_array = stuff.board_array
		update_board
	end
	def update_board
		p1 = "X"
		p2 = "O"
		tie = "Its a Tie"
		wrong_space = " "
		count = 0
		until count == 10
			counter = 0
			if count.even? == true
				player = "Player 1"
			else
				player = "Player 2"
			end
			new_board = Board.new(@game_array)
			puts " "
			puts "Varney's TTT"
			puts " "
			puts new_board.board
			puts "#{wrong_space}"
			case @game_array.count
				when 9 then
					if count == 9
						break
					else	
						puts "#{player} enter the number of the space you want to take:"	
						puts " "
						moves = gets.chomp.to_i
						system "cls"
					end	
				when 10 then
					if player == "Player 1"
						player = "Player 2"
					else
						player = "Player 1"
					end		
					puts "#{player} is the #{@game_array[9]}"
					puts " "
					tie = " "
					break
				end

			if @game_array.include?(moves) == true
				wrong_space = " "
				@game_array.each do |cell|
					if cell == moves
						if count.even? == true
							@game_array[counter] = p1
							@game_array = Winning.new(@game_array).check_win
							count += 1
						else
							@game_array[counter] = p2
							@game_array = Winning.new(@game_array).check_win
							count += 1
						end
					end
				counter += 1

				end	
			else
				wrong_space = "Try Again"	
			end
					 		
		end
		unless tie == " "
		puts "#{tie}"
		puts " "
		end					
	end
end
class The_game
	def initialize
		system "cls"
		puts " "
		puts "Varney's TTT"
		puts " "
		puts "Select game type; 1 = PVP, 2 = Easy CPU, 3 = Medium CPU, 4 = Hard CPU"
		puts " "
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




