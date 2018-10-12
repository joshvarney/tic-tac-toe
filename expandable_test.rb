require 'minitest/autorun'
require_relative 'expandable.rb'

class Tic_tac_toe_test < Minitest::Test

  def test_that_takes_input_for_board_size
    assert_equal(3, Board.new.size)
  end
  def test_that_can_make_an_array_for_board_size
    assert_equal(16, Board.new.board_array.count)
  end
end