require 'minitest/autorun'
require_relative 'expandable.rb'

class Tic_tac_toe_test < Minitest::Test

  # def test_that_takes_input_for_board_size
  #   assert_equal(4, Board.new.size)
  # end
  # def test_that_can_make_an_array_for_board_size
  #   assert_equal(16, Board.new.board_array.count)
  # end
  # def test_that_array_containts_indexes
  #   assert_equal(true, Board.new.board_array.include?(15))
  # end
  def test_that_player_can_make_move
    assert_equal(true, Human.new.board_array.include?("X"))
  end  

end