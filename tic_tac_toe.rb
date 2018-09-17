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
						moves = gets.chomp
						unless ("0".."8").include?(moves)
							moves = 9
						end
						moves = moves.to_i	
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
class One_player
	def initialize(skill)
		@skill = skill
		start_board = nil
		stuff = Board.new(start_board)
		game_board = stuff.board
		@game_array = stuff.board_array
		@marker = pick_marker
		one_board
	end
	def pick_marker
		puts " "
		puts "Varney's TTT"
		puts " "
		puts "Select X or O (X Goes First):"
		puts " "
		@marker = gets.chomp.upcase
		system "cls"
		unless ["X", "O"].include?(@marker)
			One_player.new(@skill)
		end
		@marker	
	end	
	def one_board
		@marker
		p1 = "X"
		p2 = "O"
		tie = "Its a Tie"
		wrong_space = " "
		count = 0
		until count == 10	
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
						if @marker == "X" && count.even?	
							puts "Your turn enter number of the space to place your #{@marker}:"	
							puts " " 
							moves = gets.chomp
						elsif @marker == "O" && count.odd?
							puts "Your turn enter number of the space to place your #{@marker}:"	
							puts " " 
							moves = gets.chomp
						elsif @marker == "X" && count.odd?
							puts "Wait for CPU to make move:"
							puts " "
							puts " "
							case @skill
								when 1
									moves = Easy_cpu.new(@game_array).move
								when 2
									moves = Medium_cpu.new(@game_array).move
								when 3
									moves = Hard_cpu.new(@game_array).move	
							end	
							sleep(2)
						elsif @marker == "O" && count.even?
							puts "Wait for CPU to make move:"
							puts " "
							puts " "
							case @skill
								when 1
									moves = Easy_cpu.new(@game_array).move
								when 2
									moves = Medium_cpu.new(@game_array).move
								when 3
									moves = Hard_cpu.new(@game_array).move	
							end	
							sleep(2)
						end			
						unless ("0".."8").include?(moves)
							moves = 9
						end
						moves = moves.to_i	
						system "cls"
					end			
				when 10 then
					if @marker == "X"
						winner = "You are"
					else
						winner = "The computer is"
					end		
					puts "#{winner} the #{@game_array[9]}"
					puts " "
					tie = " "
					break
				end
			if @game_array.include?(moves) == true
				wrong_space = " "
				counter = 0
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
class Easy_cpu
	def initialize(game_array)
		@game_array = game_array
		@move = cpu_move
	end	
	def cpu_move
		@game_array.each do |cell|
			if cell.class == Integer
				return cell.to_s
				break
			end				
		end
	end
	attr_reader :move
end		
class Medium_cpu
	def initialize(game_array)
		@game_array = game_array
		@move = cpu_move
	end
	def cpu_move
		array = @game_array.shuffle
		array.each do |cell|
			if cell.class == Integer
				return cell.to_s
				break
			end				
		end
	end
	attr_reader :move
end		
class Hard_cpu
	def initialize(game_array)
		@game_array = game_array
		@corners = [0, 2, 6, 8]
		@side_middle = [1, 3, 5, 7]
		@open_sides = open_side
		@open_corners = open_corner
		@turn = count_integer
		@move = cpu_move
	end
	def count_integer
		counter = 0
		p @open_spaces = []
		@game_array.each do |cell|
			if cell.class == String
				counter += 1
			else 
				@open_spaces << cell
			end
		end
		p @open_spaces
		counter
	end
	def open_corner
		@open_corners = []
		@game_array.each do |cell|
			if @corners.include?(cell)
				@open_corners << cell
			end
		end		 
	end
	def open_side
		@open_sides = []
		@game_array.each do |cell|
			if @side_middle.include?(cell)
				@open_sides << cell
			end
		end
	end			
	def cpu_move
		case @turn
		when 0
			return @corners.shuffle.last.to_s
		when 1
			if @game_array.include?(4) && @open_corners.count == 4				
				return @corners.shuffle.last.to_s
			elsif @game_array.include?(4) && @open_corners.count < 4
				return 4.to_s
			elsif @game_array.include?(4) == false
				return @corners.shuffle.last.to_s		
			end
		when 2
			if @game_array.include?(4) == false
				if @open_corners.include?(0) == false
					return 8.to_s
				elsif @open_corners.include?(6) == false
					return 2.to_s
				elsif @open_corners.include?(8) == false
					return 0.to_s
				elsif @open_corners.include?(2) == false
					return 6.to_s
				end
			elsif @game_array.include?(4) && @open_corners.count == 3 
				if @open_corners.include?(6) == false
					return 2.to_s
				elsif @open_corners.include?(8) == false
					return 0.to_s
				elsif @open_corners.include?(2) == false
					return 6.to_s
				elsif @open_corners.include?(0) == false
					return 8.to_s	
				end
			elsif @open_corners.count == 2
				return @open_corners.shuffle.last.to_s		
																
			end
		when 3 #cpu O move

			
		when 4 #cpu X move
			if @game_array.include?(4) == false
				if @open_corners.count == 2

			end	
		when 5 #cpu O move
		

		when 6 #cpu X move


		when 7 #cpu O move


		when 8
			return @open_corners[0].to_s
		end	 	
	end
	attr_reader :move
end		
class The_game
	def initialize		
		system "cls"
		puts " "
		puts "Varney's TTT"
		puts " "
		puts "Select game type; 1 = PVP, 2 = Easy CPU, 3 = Medium CPU, 4 = Hard CPU"
		puts " "
		game_type = gets.chomp
		unless ("1".."4").include?(game_type)
			game_type = 0
		end
		game_type = game_type.to_i
		if game_type < 1
			The_game.new
		else	
			system "cls"
			case game_type
				when 1
					Two_player.new
				when 2
					skill = 1
					One_player.new(skill)	
				when 3
					skill = 2
					One_player.new(skill)
				when 4
					# puts " "
					# puts "Varney's TTT"
					# puts " "
					# puts "Unbeatable Under Construction"
					# sleep(2)
					# The_game.new
					skill = 3
					One_player.new(skill)
			end				
		end	
	end
end	
The_game.new