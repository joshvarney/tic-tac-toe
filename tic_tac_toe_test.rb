require 'minitest/autorun'
require_relative 'tic_tac_toe.rb'
class Tic_tac_toe_test < Minitest::Test

	def test_something
		assert_equal(Array, Board.new.board.class)
	end
	def test_that_board_array_contains_nine_elements
		assert_equal(9, Board.new.board.count)
	end
	def test_that_can_use_board_in
		move = [0, 1, "X", "O", 4, 5, 6, 7, 8]
		assert_equal(Array, Board.new(move).class)
	end
end	