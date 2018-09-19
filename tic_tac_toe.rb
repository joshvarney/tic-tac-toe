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
# class Winning
# 	def initialize(game_array)
# 		game_array = game_array
# 		@check_win = winning_combos(game_array)
# 		@check_win
# 	end
# 	def winning_combos(check_win)
# 		@check_win = check_win
# 			if @check_win[0..2].uniq.length == 1
# 				@check_win[9] = "Winner Top Row"
# 			elsif @check_win[3..5].uniq.length == 1
# 				@check_win[9] = "Winner Middle Row"
# 			elsif @check_win[6..8].uniq.length == 1	
# 				@check_win[9] = "Winner Bottom Row"
# 			elsif @check_win[0] == @check_win[3] && @check_win[0] == @check_win[6]
# 				@check_win[9] = "Winner Left Column"
# 			elsif @check_win[1] == @check_win[4] && @check_win[1] == @check_win[7]
# 				@check_win[9] = "Winner Middle Column"
# 			elsif @check_win[2] == @check_win[5] && @check_win[2] == @check_win[8]
# 				@check_win[9] = "Winner Right Column"
# 			elsif @check_win[0] == @check_win[4] && @check_win[0] == @check_win[8]
# 				@check_win[9] = "Winner Diagonal Left to Right"
# 			elsif @check_win[2] == @check_win[4] && @check_win[2] == @check_win[6]
# 				@check_win[9] = "Winner Diagonal Right to Left"				
# 			end
# 		@check_win	
# 	end
# 	@check_win
# 	attr_reader :check_win		
# end
# class Two_player
# 	def initialize
# 		start_board = nil
# 		stuff = Board.new(start_board)
# 		game_board = stuff.board
# 		@game_array = stuff.board_array
# 		update_board
# 	end
# 	def update_board
# 		p1 = "X"
# 		p2 = "O"
# 		tie = "Its a Tie"
# 		wrong_space = " "
# 		count = 0
# 		until count == 10
# 			counter = 0
# 			if count.even? == true
# 				player = "Player 1"
# 			else
# 				player = "Player 2"
# 			end
# 			new_board = Board.new(@game_array)
# 			puts " "
# 			puts "Varney's TTT"
# 			puts " "
# 			puts new_board.board
# 			puts "#{wrong_space}"
# 			case @game_array.count
# 				when 9 then
# 					if count == 9
# 						break
# 					else	
# 						puts "#{player} enter the number of the space you want to take:"	
# 						puts " "
# 						moves = gets.chomp
# 						unless ("0".."8").include?(moves)
# 							moves = 9
# 						end
# 						moves = moves.to_i	
# 						system "cls"
# 					end	
# 				when 10 then
# 					if player == "Player 1"
# 						player = "Player 2"
# 					else
# 						player = "Player 1"
# 					end		
# 					puts "#{player} is the #{@game_array[9]}"
# 					puts " "
# 					tie = " "
# 					break
# 				end
# 			if @game_array.include?(moves) == true
# 				wrong_space = " "
# 				@game_array.each do |cell|
# 					if cell == moves
# 						if count.even? == true
# 							@game_array[counter] = p1
# 							@game_array = Winning.new(@game_array).check_win
# 							count += 1
# 						else
# 							@game_array[counter] = p2
# 							@game_array = Winning.new(@game_array).check_win
# 							count += 1
# 						end
# 					end
# 				counter += 1
# 				end	
# 			else
# 				wrong_space = "Try Again"	
# 			end					 		
# 		end
# 		unless tie == " "
# 			puts "#{tie}"
# 			puts " "
# 		end					
# 	end
# end
# class One_player
# 	def initialize(skill)
# 		@skill = skill
# 		start_board = nil
# 		stuff = Board.new(start_board)
# 		game_board = stuff.board
# 		@game_array = stuff.board_array
# 		@marker = pick_marker
# 		one_board
# 	end
# 	def pick_marker
# 		puts " "
# 		puts "Varney's TTT"
# 		puts " "
# 		puts "Select X or O (X Goes First):"
# 		puts " "
# 		@marker = gets.chomp.upcase
# 		system "cls"
# 		unless ["X", "O"].include?(@marker)
# 			One_player.new(@skill)
# 		end
# 		@marker	
# 	end	
# 	def one_board
# 		@marker
# 		p1 = "X"
# 		p2 = "O"
# 		tie = "Its a Tie"
# 		wrong_space = " "
# 		count = 0
# 		until count == 10	
# 			new_board = Board.new(@game_array)
# 			puts " "
# 			puts "Varney's TTT"
# 			puts " "
# 			puts new_board.board
# 			puts "#{wrong_space}"
# 			case @game_array.count
# 				when 9 then
# 					if count == 9
# 						break
# 					else	
# 						if @marker == "X" && count.even?	
# 							puts "Your turn enter number of the space to place your #{@marker}:"	
# 							puts " " 
# 							moves = gets.chomp
# 						elsif @marker == "O" && count.odd?
# 							puts "Your turn enter number of the space to place your #{@marker}:"	
# 							puts " " 
# 							moves = gets.chomp
# 						elsif @marker == "X" && count.odd?
# 							puts "Wait for CPU to make move:"
# 							puts " "
# 							puts " "
# 							case @skill
# 								when 1
# 									moves = Easy_cpu.new(@game_array).move
# 								when 2
# 									moves = Medium_cpu.new(@game_array).move
# 								when 3
# 									moves = Hard_cpu.new(@game_array, @marker).move	
# 							end	
# 							sleep(2)
# 						elsif @marker == "O" && count.even?
# 							puts "Wait for CPU to make move:"
# 							puts " "
# 							puts " "
# 							case @skill
# 								when 1
# 									moves = Easy_cpu.new(@game_array).move
# 								when 2
# 									moves = Medium_cpu.new(@game_array).move
# 								when 3
# 									moves = Hard_cpu.new(@game_array, @marker).move	
# 							end	
# 							sleep(2)
# 						end			
# 						unless ("0".."8").include?(moves)
# 							moves = 9
# 						end
# 						moves = moves.to_i	
# 						system "cls"
# 					end			
# 				when 10 then
# 					if @marker == "O" && count.even?
# 						winner = "You are"
# 					elsif @marker == "O" && count.odd?
# 						winner = "The computer is"
# 					elsif @marker == "X" && count.even?
# 						winner = "The computer is"
# 					elsif @marker == "X" && count.odd?
# 						winner = "You are"	
# 					end		
# 					puts "#{winner} the #{@game_array[9]}"
# 					puts " "
# 					tie = " "
# 					break
# 				end
# 			if @game_array.include?(moves) == true
# 				wrong_space = " "
# 				counter = 0
# 				@game_array.each do |cell|
# 					if cell == moves
# 						if count.even? == true
# 							@game_array[counter] = p1
# 							@game_array = Winning.new(@game_array).check_win
# 							count += 1
# 						else
# 							@game_array[counter] = p2
# 							@game_array = Winning.new(@game_array).check_win
# 							count += 1
# 						end
# 					end
# 				counter += 1
# 				end	
# 			else
# 				wrong_space = "Try Again"	
# 			end					 		
# 		end
# 		unless tie == " "
# 			puts "#{tie}"
# 			puts " "
# 		end					
# 	end
# end
# class Easy_cpu
# 	def initialize(game_array)
# 		@game_array = game_array
# 		@move = cpu_move
# 	end	
# 	def cpu_move
# 		@game_array.each do |cell|
# 			if cell.class == Integer
# 				return cell.to_s
# 				break
# 			end				
# 		end
# 	end
# 	attr_reader :move
# end		
# class Medium_cpu
# 	def initialize(game_array)
# 		@game_array = game_array
# 		@move = cpu_move
# 	end
# 	def cpu_move
# 		array = @game_array.shuffle
# 		array.each do |cell|
# 			if cell.class == Integer
# 				return cell.to_s
# 				break
# 			end				
# 		end
# 	end
# 	attr_reader :move
# end		
# class Hard_cpu
# 	def initialize(game_array, marker)
# 		@game_array = game_array
# 		@corners = [0, 2, 6, 8]
# 		@side_middle = [1, 3, 5, 7]
# 		@open_sides = open_side
# 		@open_corners = open_corner
# 		@turn = count_integer
# 		if marker == "X"
# 			@cpu_marker = "O"
# 		else 
# 			@cpu_marker = "X"	
# 		end	
# 		@move = cpu_move		
# 	end
# 	def count_integer
# 		counter = 0
# 		@open_spaces = []
# 		@game_array.each do |cell|
# 			if cell.class == String
# 				counter += 1
# 			else 
# 				@open_spaces << cell
# 			end
# 		end
# 		@open_spaces
# 	end
# 	def open_corner
# 		@open_corners = []
# 		@game_array.each do |cell|
# 			if @corners.include?(cell)
# 				@open_corners << cell
# 			end
# 		end
# 		@open_corners		 
# 	end
# 	def open_side
# 		@open_sides = []
# 		@game_array.each do |cell|
# 			if @side_middle.include?(cell)
# 				@open_sides << cell
# 			end
# 		end
# 		@open_sides
# 	end
# 	def terminal_board
# 		@middle_corner = [[0, 4], [2, 4], [6, 4], [8, 4]]
# 		@block_moves = [[3, 1, 0], [1, 5, 2], [7, 5, 8], [3, 7, 6], [0, 7, 3], [0, 5, 1], [3, 2, 1], [2, 7, 5], [1, 6, 3], [5, 6, 7], [3, 8, 7], [1, 8, 5]]
# 		@terminal_combos = [[0, 1, 2], [1, 2, 0], [3, 4, 5], [4, 5, 3], [6, 7, 8], [7, 8, 6], [0, 3, 6], [3, 6, 0], [1, 4, 7], [4, 7, 1], [2, 5, 8], [5, 8, 2], [2, 4, 6], [4, 6, 2], [0, 4, 8], [4, 8, 0], [0, 2, 1], [0, 6, 3], [0, 8, 4], [1, 7, 4], [2, 8, 5], [2, 6, 4], [3, 5, 4], [6, 8, 7]]
# 	end
# 	def cpu_move
# 		terminal_board
# 		if @open_spaces.count == 9
# 			return @open_corners.shuffle.last.to_s
# 		elsif @open_spaces.count == 7
# 			@middle_corner.each do |combo|
# 				if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					case combo[0]
# 						when 0 then return "8"
# 						when 2 then return "6"
# 						when 6 then return "2"
# 						when 8 then return "0"
# 					end
# 				end
# 			end
# 		elsif @open_spaces.count == 1
# 			return @open_spaces[0].to_s	
# 		end			 
# 		if  @game_array.include?(4)
# 			return 4.to_s
# 		elsif @open_spaces.count == 8
# 			return @open_corners.shuffle.last.to_s
# 		end	
# 		@terminal_combos.each do |combo|
# 			if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 				if @game_array[combo[0]] == @cpu_marker && @game_array[combo[1]] == @cpu_marker 
# 					if @game_array.include?(combo[2])
# 				 		return combo[2].to_s
# 			 		end
# 			 	end
# 			end
# 		end
# 		@terminal_combos.each do |combo|
# 			if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 				if @game_array[combo[0]] == @game_array[combo[1]] 
# 					if @game_array.include?(combo[2])
# 						return combo[2].to_s
# 					end
# 				end
# 			end
# 		end
# 		@block_moves.each do |combo|
# 			if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 				if @game_array[combo[0]] == @game_array[combo[1]] 
# 					if @game_array.include?(combo[2])
# 						return combo[2].to_s
# 					end
# 			 	end
# 			end
# 		end
# 		@middle_corner.each do |combo|
# 			if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 			 	if @game_array[combo[0]] == @game_array[combo[1]] 
# 			 		if @open_corners.count == 2
# 				 		return @open_corners.shuffle.last.to_s
# 			 		end
# 			 	end
# 			end
# 		end
# 		if @open_corners.count > 0
# 			return @open_sides.shuffle.last.to_s
# 		else	
# 			return @open_spaces.shuffle.last.to_s
# 		end			
# 	end	
# 	attr_reader :move
# end		
class The_game
	def initialize		
		system "cls"
		puts " "
		puts "Varney's TTT"
		puts " "
		puts "Select game type; 1 = PVP, 2 = Easy CPU, 3 = Medium CPU, 4 = Hard CPU"
		puts " "
		# game_type = gets.chomp
		# unless ("1".."4").include?(game_type)
		# 	game_type = 0
		# end
		# game_type = game_type.to_i
		# if game_type < 1
		# 	The_game.new
		# else	
		# 	system "cls"
		# 	case game_type
		# 		when 1
		# 			Two_player.new
		# 		when 2
		# 			skill = 1
		# 			One_player.new(skill)	
		# 		when 3
		# 			skill = 2
		# 			One_player.new(skill)
		# 		when 4
		# 			skill = 3
		# 			One_player.new(skill)
		# 	end				
		# end	
	end
end	
The_game.new