require 'minitest/autorun'
require_relative 'tic_tac_toe.rb'
class Tic_tac_toe_test < Minitest::Test

	# def test_something
	# 	assert_equal(Array, Board.new.board.class)
	# end
	# def test_that_board_array_contains_nine_elements
	# 	assert_equal(9, Board.new.board.count)
	# end
	# def test_that_game_board_fills_in_correctly
	# 	assert_equal([0, 1, 2, 3, 4, 5, 6, 7, 8], Board.new(nil).board_array)
	# end
	# def test_that_grid_prints_to_console
	# 	assert_equal(String, Board.new(nil).board.class)
	# end
	# def test_that_can_the_game_runs_pvp
	# 	assert_equal(The_game, The_game.new.class)
	# end
	# def test_that_replaces_cells
	# 	assert_equal(Two_player, Two_player.new.class)
	# end
	# def test_that_switches_markers_correctly
	# 	assert_equal(true, Two_player.new.game_array.include?("O"))
	# end
	def test_that_returns_winner_with_three_in_a_row
		assert_equal("Winner", Winning.new(["X", "X", "X", 3, 4, 5, 6, 7, 8]).check_win
	end
	# def test_that_winning_works
	# 	w = ["X", "X", "X", 3, 4, 5, 6, 7, 8]
	# 	assert_equal(["X", "X", "X", 3, 4, 5, 6, 7, 8, "Winner"], Winning.new(w))
	# end
	
end	