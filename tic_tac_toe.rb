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
class One_player
	def initialize(skill, game_array, marker)
		@skill = skill
		@game_array = game_array
		@marker = marker
		if @marker == "X"
			@cpu_marker = "O"
		else
			@cpu_marker = "X"
		end	
		@game_array = one_board
	end
	def one_board
		case @skill
			when 1 then moves = Easy_cpu.new(@game_array).move
			when 2 then moves = Medium_cpu.new(@game_array).move
			when 3 then moves = Hard_cpu.new(@game_array, @marker).move	
		end					
		counter = 0
		@game_array.each do |cell|
			if cell.to_s == moves
				@game_array[counter] = @cpu_marker
				@game_array = Winning.new(@game_array).check_win
			end
		counter += 1
		end						
	end
	attr_reader :game_array
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
	def initialize(game_array, marker)
		@game_array = game_array
		@corners = [0, 2, 6, 8]
		@side_middle = [1, 3, 5, 7]
		@open_sides = open_side
		@open_corners = open_corner
		@open_spaces = open_space
		if marker == "X"
			@cpu_marker = "O"
		else 
			@cpu_marker = "X"	
		end	
		@move = cpu_move		
	end
	def open_space
		@open_spaces = []
		@game_array.each do |cell|
			if cell.class == Integer 
				@open_spaces << cell
			end
		end
		@open_spaces
	end
	def open_corner
		@open_corners = []
		@game_array.each do |cell|
			if @corners.include?(cell)
				@open_corners << cell
			end
		end
		@open_corners		 
	end
	def open_side
		@open_sides = []
		@game_array.each do |cell|
			if @side_middle.include?(cell)
				@open_sides << cell
			end
		end
		@open_sides
	end
	def terminal_board
		@stupid_move = [0, 4, 8], [6, 4, 2]
		@middle_corner = [[0, 4], [2, 4], [6, 4], [8, 4]]
		@terminal_combos = [[0, 1, 2], [1, 2, 0], [3, 4, 5], [4, 5, 3], [6, 7, 8], [7, 8, 6], [0, 3, 6], [3, 6, 0], [1, 4, 7], [4, 7, 1], [2, 5, 8], [5, 8, 2], [2, 4, 6], [4, 6, 2], [0, 4, 8], [4, 8, 0], [0, 2, 1], [0, 6, 3], [0, 8, 4], [1, 7, 4], [2, 8, 5], [2, 6, 4], [3, 5, 4], [6, 8, 7], [3, 1, 0], [1, 5, 2], [7, 5, 8], [3, 7, 6], [0, 7, 3], [0, 5, 1], [3, 2, 1], [2, 7, 5], [1, 6, 3], [5, 6, 7], [3, 8, 7], [1, 8, 5]]
	end
	def cpu_move
		terminal_board
		if @open_spaces.count == 9
			return @open_corners.shuffle.last.to_s
		elsif @open_spaces.count == 7
			@middle_corner.each do |combo|
				if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false
					case combo[0]
						when 0 then return "8"
						when 2 then return "6"
						when 6 then return "2"
						when 8 then return "0"
					end
				end
			end
		elsif @open_spaces.count == 6
			@stupid_move.each do |combo|
				if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false && @game_array.include?(combo[2]) == false && @game_array[combo[0]] != @game_array[combo[2]]		
					return @open_corners.shuffle.last.to_s
				end
			end			
		elsif @open_spaces.count == 1
			return @open_spaces[0].to_s	
		end			 
		if  @game_array.include?(4)
			return 4.to_s
		elsif @open_spaces.count == 8
			return @open_corners.shuffle.last.to_s
		end	
		@terminal_combos[0..23].each do |combo|
			if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false && @game_array[combo[0]] == @cpu_marker && @game_array[combo[1]] == @cpu_marker && @game_array.include?(combo[2])
				return combo[2].to_s
			end
		end
		@terminal_combos.each do |combo|
			if @game_array.include?(combo[0]) == false && @game_array.include?(combo[1]) == false && @game_array[combo[0]] == @game_array[combo[1]] && @game_array.include?(combo[2])
				return combo[2].to_s
			end
		end
		if @open_corners.count > 0
			return @open_sides.shuffle.last.to_s
		else	
			return @open_spaces.shuffle.last.to_s
		end			
	end	
	attr_reader :move
end	