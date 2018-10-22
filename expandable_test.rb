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
    assert_equal(4, things.size)     
    assert_equal([0,4,8,12], things.column_group[0])
    assert_equal([1,5,9,13], things.column_group[1])
    assert_equal([2,6,10,14], things.column_group[2])
    assert_equal([3,7,11,15], things.column_group[3])
    assert_equal([0,1,2,3], things.row_group[0])
    assert_equal([4,5,6,7], things.row_group[1])
    assert_equal([8,9,10,11], things.row_group[2])
    assert_equal([12,13,14,15], things.row_group[3])
    assert_equal([0,5,10,15], things.diagonal_group[0])
    assert_equal([3,6,9,12], things.diagonal_group[1])
    assert_equal(true, things.middle_array.include?(9))
    assert_equal(true, things.middle_array.include?(10))
    assert_equal(true, things.middle_array.include?(5))
    assert_equal(true, things.middle_array.include?(6))
    assert_equal(false, things.middle_array.include?(4))
    assert_equal(false, things.middle_array.include?(11))
    
    board_array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    things = Build_array.new(board_array)
    assert_equal(5, things.column_group.count)
    assert_equal(5, things.row_group.count)
    assert_equal(2, things.diagonal_group.count)
    assert_equal(12, things.winning_groups.count)
    assert_equal(5, things.size)     
    assert_equal([0,5,10,15,20], things.column_group[0])
    assert_equal([1,6,11,16,21], things.column_group[1])
    assert_equal([2,7,12,17,22], things.column_group[2])
    assert_equal([3,8,13,18,23], things.column_group[3])
    assert_equal([4,9,14,19,24], things.column_group[4])
    assert_equal([0,1,2,3,4], things.row_group[0])
    assert_equal([5,6,7,8,9], things.row_group[1])
    assert_equal([10,11,12,13,14], things.row_group[2])
    assert_equal([15,16,17,18,19], things.row_group[3])
    assert_equal([20,21,22,23,24], things.row_group[4])
    assert_equal([0,6,12,18,24], things.diagonal_group[0])
    assert_equal([4,8,12,16,20], things.diagonal_group[1])
  end
  def test_that_end_game_class_runs_correct
    board_array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    assert_equal(false, End_game.new(board_array).game_over)
    
    board_array = ["X","O","X","O","X","O","X","O","X","O","X","O","X","O","X","O"]
    assert_equal("Tie", End_game.new(board_array).game_over)
    
    board_array = ["X","X","X","X",4,5,6,7,8,9,10,11,12,13,14,15]
    assert_equal("Player Wins", End_game.new(board_array).game_over)
    
    board_array = [0,1,2,"X",4,5,6,"X",8,9,10,"X",12,13,14,"X"]
    assert_equal("Player Wins", End_game.new(board_array).game_over)
    
    board_array = ["X",1,2,3,4,"X",6,7,8,9,"X",11,12,13,14,"X"]
    assert_equal("Player Wins", End_game.new(board_array).game_over)
    
    board_array = [0,1,2,3,4,5,6,7,8,9,10,11,"X","X","X","X"]
    assert_equal("Player Wins", End_game.new(board_array).game_over)
    
    board_array = [0,"O",2,3,4,"O",6,7,8,"O",10,11,12,"O",14,15]
    assert_equal("Computer Wins", End_game.new(board_array).game_over)
    
    board_array = [0,1,2,3,"O","O","O","O",8,9,10,11,12,13,14,15]
    assert_equal("Computer Wins", End_game.new(board_array).game_over)
    
    board_array = [0,1,2,"O",4,5,"O",7,8,"O",10,11,"O",13,14,15]
    assert_equal("Computer Wins", End_game.new(board_array).game_over)
    
    board_array = [0,1,"O",3,4,5,"O",7,8,9,"O",11,12,13,"O",15]
    assert_equal("Computer Wins", End_game.new(board_array).game_over)
  end
  def test_that_computer_moves_class_is_making_correct_moves
    board_array = ["X",1,2,3,4,5,6,7,8,"X",10,11,12,13,14,15]
    assert_equal([1,4,5,3,10,8,13,5,14,12,6,4], Computer.new(board_array).these_moves)
    assert_equal([0,9], Computer.new(board_array).pmoves)
    assert_equal(true, Computer.new(board_array).board_array.include?("O"))
    
    board_array = ["X",1,2,3,4,5,6,7,8,9,"X",11,12,13,14,"X"]
    assert_equal([0,10,15], Computer.new(board_array).pmoves)
    assert_equal(17, Computer.new(board_array).these_moves.count)
    assert_equal("O", Computer.new(board_array).board_array[5])
    
    board_array = ["X",1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    assert_equal([0], Computer.new(board_array).pmoves)
    assert_equal(4, Computer.new(board_array).these_moves.count)
    assert_equal("O", Computer.new(board_array).board_array[12])
  end  
end