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
  # def test_that_player_can_make_move
  #   assert_equal(true, Human.new.board_array.include?("X"))
  # end  
  # def test_that_grid_populates_correctly_after_choice
  #   assert_equal()
  # end
  def test_that_build_array_class_is_building_everything_correct
    board_array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    things = Build_array.new(board_array)
    assert_equal(4, things.column_group.count)
    assert_equal(4, things.row_group.count)
    assert_equal(2, things.diagonal_group.count)
    assert_equal(10, things.winning_groups.count)
    assert_equal(4, things.middle_array.count)     
    assert_equal([0,4,8,12], things.column_group[0])
  end    
end