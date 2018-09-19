# def cpu_move_o
# 		@terminal_combos = terminal_board
# 		case @turn
# 			when 1
# 				if  @game_array.include?(4)
# 					return 4.to_s
# 				else 
# 					return @open_corners.shuffle.last.to_s
# 				end	
# 			when 3
# 				@terminal_combos.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == "O" && @game_array[combo[1]] == "O" 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				@terminal_combos.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == @game_array[combo[1]] 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				@block_moves.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == @game_array[combo[1]] 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				if @open_corners.count > 0
# 					return @open_sides.shuffle.last.to_s
# 				else	
# 					return @open_spaces.shuffle.last.to_s
# 				end	
# 			when 5
# 				@terminal_combos.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == "O" && @game_array[combo[1]] == "O" 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				@terminal_combos.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == @game_array[combo[1]] 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				@block_moves.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == @game_array[combo[1]] 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				if @open_corners.count > 0
# 					return @open_sides.shuffle.last.to_s
# 				else	
# 					return @open_spaces.shuffle.last.to_s
# 				end	
# 			when 7
# 				@terminal_combos.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == "O" && @game_array[combo[1]] == "O" 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				@terminal_combos.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == @game_array[combo[1]] 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				@block_moves.each do |combo|
# 					if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
# 					 	if @game_array[combo[0]] == @game_array[combo[1]] 
# 					 		if @game_array.include?(combo[2])
# 						 		return combo[2].to_s
# 					 		end
# 					 	end
# 					end
# 				end
# 				if @open_corners.count > 0
# 					return @open_sides.shuffle.last.to_s
# 				else	
# 					return @open_spaces.shuffle.last.to_s
# 				end	
# 		end		
# 	end	
# 	attr_reader :move
# end		





# class Easy_cpu
# 	def initialize
# 		start_board = nil
# 		stuff = Board.new(start_board)
# 		game_board = stuff.board
# 		@game_array = stuff.board_array
# 		@marker = pick_marker
# 		easy_board
# 	end
# 	def pick_marker
# 		puts " "
# 		puts "Select X or O (X Goes First):"
# 		puts " "
# 		@marker = gets.chomp.upcase
# 		system "cls"
# 		unless ["X", "O"].include?(@marker)
# 			Easy_cpu.new
# 		end
# 		@marker	
# 	end	
# 	def easy_board
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
# 							moves = cpu_move
# 							sleep(2)
# 						elsif @marker == "O" && count.even?
# 							puts "Wait for CPU to make move:"
# 							puts " "
# 							puts " "
# 							moves = cpu_move
# 							sleep(2)
# 						end			
# 						unless ("0".."8").include?(moves)
# 							moves = 9
# 						end
# 						moves = moves.to_i	
# 						system "cls"
# 					end			
# 				when 10 then
# 					if @marker == "X"
# 						winner = "You are"
# 					else
# 						winner = "The computer is"
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
# 		puts "#{tie}"
# 		puts " "
# 		end					
# 	end
# 	def cpu_move
# 		@game_array.each do |cell|
# 			if cell.class == Integer
# 				return cell.to_s
# 				break
# 			end				
# 		end
# 	end	
# end
# class Medium_cpu
# 	def initialize
# 		start_board = nil
# 		stuff = Board.new(start_board)
# 		game_board = stuff.board
# 		@game_array = stuff.board_array
# 		@marker = pick_marker
# 		easy_board
# 	end
# 	def pick_marker
# 		puts " "
# 		puts "Select X or O (X Goes First):"
# 		puts " "
# 		@marker = gets.chomp.upcase
# 		system "cls"
# 		unless ["X", "O"].include?(@marker)
# 			Medium_cpu.new
# 		end
# 		@marker	
# 	end	
# 	def easy_board
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
# 							moves = cpu_move
# 							sleep(2)
# 						elsif @marker == "O" && count.even?
# 							puts "Wait for CPU to make move:"
# 							puts " "
# 							puts " "
# 							moves = cpu_move
# 							sleep(2)
# 						end			
# 						unless ("0".."8").include?(moves)
# 							moves = 9
# 						end
# 						moves = moves.to_i	
# 						system "cls"
# 					end			
# 				when 10 then
# 					if @marker == "X"
# 						winner = "You are"
# 					else
# 						winner = "The CPU is"
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
# 		puts "#{tie}"
# 		puts " "
# 		end					
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
# end
# class Hard_cpu
# 	def initialize
# 		start_board = nil
# 		stuff = Board.new(start_board)
# 		game_board = stuff.board
# 		@game_array = stuff.board_array
# 		@marker = pick_marker
# 		easy_board
# 	end
# 	def pick_marker
# 		puts " "
# 		puts "Select X or O (X Goes First):"
# 		puts " "
# 		@marker = gets.chomp.upcase
# 		system "cls"
# 		unless ["X", "O"].include?(@marker)
# 			Hard_cpu.new
# 		end
# 		@marker	
# 	end	
# 	def easy_board
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
# 							moves = cpu_move
# 							sleep(2)
# 						elsif @marker == "O" && count.even?
# 							puts "Wait for CPU to make move:"
# 							puts " "
# 							puts " "
# 							moves = cpu_move
# 							sleep(2)
# 						end			
# 						unless ("0".."8").include?(moves)
# 							moves = 9
# 						end
# 						moves = moves.to_i	
# 						system "cls"
# 					end			
# 				when 10 then
# 					if @marker == "X"
# 						winner = "You are"
# 					else
# 						winner = "The CPU is"
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
# 		puts "#{tie}"
# 		puts " "
# 		end					
# 	end
# 	def cpu_move
# 		@game_array
# 	end	
# end				

# class Sequential_class
# 	def initialize
#	end
# end
# class Random_class
# 	def initialize
# 	end
# end
# class Unbeatable_class
# def cpu_move
# 		case @turn
# 		when 0
# 			return @corners.shuffle.last.to_s
# 		when 1
# 			if @game_array.include?(4) && @open_corners.count == 4				
# 				return @corners.shuffle.last.to_s
# 			elsif @game_array.include?(4) && @open_corners.count < 4
# 				return 4.to_s
# 			elsif @game_array.include?(4) == false
# 				return @corners.shuffle.last.to_s		
# 			end
# 		when 2
# 			if @game_array.include?(4) == false
# 				if @open_corners.include?(0) == false
# 					return 8.to_s
# 				elsif @open_corners.include?(6) == false
# 					return 2.to_s
# 				elsif @open_corners.include?(8) == false
# 					return 0.to_s
# 				elsif @open_corners.include?(2) == false
# 					return 6.to_s
# 				end
# 			elsif @game_array.include?(4) && @open_corners.count == 3 
# 				if @open_corners.include?(6) == false
# 					return 2.to_s
# 				elsif @open_corners.include?(8) == false
# 					return 0.to_s
# 				elsif @open_corners.include?(2) == false
# 					return 6.to_s
# 				elsif @open_corners.include?(0) == false
# 					return 8.to_s	
# 				end
# 			elsif @open_corners.count == 2
# 				return @open_corners.shuffle.last.to_s		
																
# 			end
# 		when 3 #cpu O move

			
# 		when 4 #cpu X move
# 			if @game_array.include?(4) && @open_corners.count == 0
# 				if @game_array[0] == "X" && @game_array[2] == "X"
# 					return 1.to_s
# 				elsif @game_array[2] == "X" && @game_array[8] == "X"
# 					return 5.to_s
# 				elsif @game_array[8] == "X" && @game_array[6] == "X"
# 					return 7.to_s
# 				elsif @game_array[6] == "X" && @game_array[0] == "X"
# 					return 3.to_s
# 				end			 
# 			elsif @game_array.include?(4) == false
# 				if @open_corners.count == 1
# 					if @open_corners.include?(0)
# 						return 0.to_s
# 					elsif @open_corners.include?(2)
# 						return 2.to_s
# 					elsif @open_corners.include?(6)
# 						return 6.to_s
# 					elsif @open_corners.include?(8)
# 						return 8.to_s			
# 					end	
# 				elsif @open_corners.count == 2
# 					if @open_sides.include?(1) == false
# 						return 7.to_s
# 					elsif @open_sides.include?(3) == false
# 						return 5.to_s
# 					elsif @open_sides.include?(5) == false
# 						return 3.to_s
# 					elsif @open_sides.include?(7) == false
# 						return 1.to_s
# 					end
# 				end						
# 			elsif @game_array.include?(4) 
# 				if @open_corners.count == 0
# 					return 4.to_s 	
# 				end		
# 			end	
# 		when 5 #cpu O move
		

# 		when 6 #cpu X move
# 			if @open_corners.count == 2
# 				if @game_array[6] == "X" && @game_array[3] == "X"
# 					return 0.to_s
# 				elsif @game_array[1] == "X" && @game_array[2] == "X"
# 					return 0.to_s
# 				elsif @game_array[2] == "X" && @game_array[5] == "X"
# 					return 8.to_s
# 				elsif @game_array[7] == "X" && @game_array[8] == "X"
# 					return 6.to_s 
# 				else 
# 					@open_spaces[0].to_s
# 				end				
# 			end

# 		when 7 #cpu O move


# 		when 8
# 			return @open_spaces[0].to_s
# 		end	 	
# 	end
# end

# [
# 	0, 1, 2, 
# 	3, 4, 5, 
# 	6, 7, 8
# ]

# ["X", "X", "X", 3, 4, 5, 6, 7, 8]
# ["O", "O", "O", 3, 4, 5, 6, 7, 8]

# [0, 1, 2, "X", "X", "X", 6, 7, 8]
# [0, 1, 2, "O", "O", "O", 6, 7, 8]

# [0, 1, 2, 3, 4, 5, "X", "X", "X"]
# [0, 1, 2, 3, 4, 5, "O", "O", "O"]

# ["X", 1, 2, "X", 4, 5, "X", 7, 8]
# ["O", 1, 2, "O", 4, 5, "O", 7, 8]

# 0 3 6

# [0, "X", 2, 3, "X", 5, 6, "X", 8]
# [0, "O", 2, 3, "O", 5, 6, "O", 8]

# 1 4 7

# [0, 1, "X", 3, 4, "X", 6, 7, "X"]
# [0, 1, "O", 3, 4, "O", 6, 7, "O"]

# 2 5 8

# ["X", 1, 2, 3, "X", 5, 6, 7, "X"]
# ["X", 1, 2, 3, "O", 5, 6, 7, "O"]

# 0 4 8

# stuff = [0, 1, "X", 3, "X", 5, "X", 7, 8]
# [0, 1, "O", 3, "O", 5, "O", 7, 8]

# 2 4 6
#  

# p ["X", "O"].include?("O")

# comt = 0
# while (comt < 10)
#     sleep(3)
#     comt = comt +1
#     puts comt
# end#while
# things = stuff.shuffle
# p stuff 
# p things
# corners = [0, 2, 6, 8]
# side_middle = [1, 3, 5, 7]
# p [0, 1, 2, 3, 4, 5, 6, 7, 8].join.include?(corners.join)
# p ["X", 1, 2, 3, "O", 5, 6, 7, "O"].include?("O")
matches = []
starting_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
terminal_combos = [[0, 1, 2], [1, 2, 0], [3, 4, 5], [4, 5, 3], [6, 7, 8], [7, 8, 6], [0, 3, 6], [3, 6, 0], [1, 4, 7], [4, 7, 1], [2, 5, 8], [5, 8, 2], [2, 4, 6], [4, 6, 2], [0, 4, 8], [4, 8, 0], [0, 2, 1], [0, 6, 3], [0, 8, 4], [1, 7, 4], [2, 8, 5], [2, 6, 4], [3, 5, 4], [6, 8, 7]]
game_array = [0, 1, 2, 3, 4, 5, 6, "X", "X"]
counter = 0
terminal_combos.each do |combo|
	if game_array.include?(combo[0]) == false && game_array.include?(combo[1]) == false
	 	if game_array[combo[0]] == game_array[combo[1]] 
	 	counter += 1
	 	matches << combo[2]
	 	end
	end
end
p counter
p matches[0].to_s