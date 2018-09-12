class Board
	def initialize 
		@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
	end
	attr_reader :board
end
def game_board(board)
	board = board
end	
p game_board

class Sequential_class
	attr_reader :board
	def initialize
		@board = game_board(board)
		if @board == nil
			@board = Board.new
			@board = board.board
			@board
		end
		@board
	end
	# def make_move
	# 	@board.each do |cell|
	# 		if cell == " "
	# 			cell
	# 		end
	# 	end
	# end
	attr_accessor :board		
end
stuff = Sequential_class.new
p stuff.board
class Random_class
	def initialize

	end
end

class Unbeatable_class
	def initialize

	end
end
class Two_player
	def initialize

	end
end
class Player_choice
	def initialize

	end
end
class The_game
end	