require 'minitest/autorun'
require_relative 'tic_tac_toe.rb'
class Tic_tac_toe_test < Minitest::Test

	# def test_something
	# 	assert_equal(Array, Board.new.board.class)
	# end
	# def test_that_board_array_contains_nine_elements
	# 	assert_equal(9, Board.new.board.count)
	# end
	def test_that_can_the_game_runs_pvp
		assert_equal(The_game, The_game.new.class)
	end
	def test_that_replaces_cells
		assert_equal(Two_player, Two_player.new.class)
	end
	def test_that_winning_works
		w = ["X", "X", "X", 3, 4, 5, 6, 7, 8]
		assert_equal(["X", "X", "X", 3, 4, 5, 6, 7, 8, "Winner"], Winning.new(w))
	end
	
end	