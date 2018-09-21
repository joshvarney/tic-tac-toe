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
	# def test_that_returns_winner_with_three_in_a_row
	# 	assert_equal("Winner", Winning.new(["X", "X", "X", 3, 4, 5, 6, 7, 8]).check_win
	# end
	# def test_that_winning_works
	# 	w = ["X", "X", "X", 3, 4, 5, 6, 7, 8]
	# 	assert_equal(["X", "X", "X", 3, 4, 5, 6, 7, 8, "Winner"], Winning.new(w))
	# end
	# def test_that_easy_works_in_order
	# 	assert_equal(["X", "X", "X", "O", "O", 5, 6, 7, 8, "The Computer is the Winner Top Row"], One_player.new(1).board_array)
	# end
	# def test_that_easy_work_when_o
	# 	assert_equal(["O", "O", "O", "X", "X", 5, "X", 7, 8, "The Computer is the Winner Top Row"], One_player.new(1).board_array)
	# end
	# def test_that_medium_works_in_order
	# 	refute_equal(["X", "X", "X", "O", "O", 5, 6, 7, 8, "The Computer is the Winner Top Row"], One_player.new(2).board_array)
	# end
	# def test_that_medium_works_when_o
	# 	refute_equal(["O", "O", "O", "X", "X", 5, "X", 7, 8, "The Computer is the Winner Top Row"], One_player.new(2).board_array)
	# end
	# def test_that_hard_takes_the_middle_if_player_takes_corner
	# 	assert_equal("O", One_player.new(3).game_array[4])
	# end
	# def test_that_board_makes_new_array_if_nil
	# 	assert_equal(Array, Board.new(nil).board_array.class)
	# end
	# def test_that_contains_correct_amount_of_elements
	# 	assert_equal(9, Board.new(nil).board_array.count)
	# end	
	# def test_that_board_returns_grid_string
	# 	assert_equal(String, Board.new(nil).board.class)
	# end
	# def test_that_board_string_is_long_enough
	# 	assert_equal(59, Board.new(nil).board.split("").count)
	# end
	# def test_that_the_game_inits
	# 	assert_equal(The_game, The_game.new.class)
	# end
	# def test_that_the_game_takes_in_user_input
	# 	assert_equal("1", The_game.new.game_type)
	# end
	# def test_that_cpu_skill_gets_passed_to_one_player_class
	# 	assert_equal(1, One_player.new(1).skill)
	# end
	# def test_that_can_pick_x_or_o
	# 	assert_equal("X", One_player.new(1).marker)
	# end
	# def test_that_will_not_take_anything_besides_x_o
	# 	refute_equal("Y", One_player.new(1).marker)
	# end
	# def test_that_upcases_marker
	# 	assert_equal("X", One_player.new(1).marker)							
	# end
	# def test_that_game_array_is_in_oneplayer
	# 	assert_equal(Array, One_player.new(1).game_array.class)
	# end
	# def test_that_easy_cpu_works_in_sequence
	# 	assert_equal(String, Easy_cpu.new("X").move.class)
	# end			
	# def test_that_medium_cpu_shuffles_and_returns
	# 	refute_equal(0, Medium_cpu.new("X").game_array[0])
	# end
	# def test_that_winning_works
	# 	game_array = ["X", "X", "X", 3, 4, 5, 6, 7, 8]
	# 	assert_equal("Winner Top Row", Winning.new(game_array).check_win[9])
		
	# 	game_array = [0, 1, 2, "O", "O", "O", 6, 7, 8]
	# 	assert_equal("Winner Middle Row", Winning.new(game_array).check_win[9])
		
	# 	game_array = [0, 1, 2, 3, 4, 5, "X", "X", "X"]
	# 	assert_equal("Winner Bottom Row", Winning.new(game_array).check_win[9])
		
	# 	game_array = [0, 1, "O", 3, 4, "O", 6, 7, "O"]
	# 	assert_equal("Winner Right Column", Winning.new(game_array).check_win[9])
		
	# 	game_array = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
	# 	assert_equal("Winner Left Column", Winning.new(game_array).check_win[9])
		
	# 	game_array = [0, 1, "X", 3, "X", 5, "X", 7, 8]
	# 	assert_equal("Winner Diagonal Right to Left", Winning.new(game_array).check_win[9])
	
	# 	game_array = [0, "O", 2, 3, "O", 5, 6, "O", 8]
	# 	assert_equal("Winner Middle Column", Winning.new(game_array).check_win[9])
		
	# 	game_array = ["X", 1, 2, 3, "X", 5, 6, 7, "X"]
	# 	assert_equal("Winner Diagonal Left to Right", Winning.new(game_array).check_win[9])
	# end
	# def test_that_hard_cpu_is_functioning
	# 	game_array = [0, "X", 2, 3, 4, 5, 6, 7, 8]
	# 	marker = "X"
	# 	assert_equal(3, Hard_cpu.new(game_array, marker).open_sides.count)

	# 	game_array = [0, 1, 2, "X", 4, 5, 6, "O", 8]
	# 	marker = "O"
	# 	assert_equal(2, Hard_cpu.new(game_array, marker).open_sides.count)

	# 	game_array = [0, "X", 2, "O", 4, "X", 6, "O", 8]
	# 	marker = "X"
	# 	assert_equal(0, Hard_cpu.new(game_array, marker).open_sides.count)
	# end
	# def test_that_open_corners_function_works
	# 	game_array = ["X", 1, 2, 3, 4, 5, 6, 7, 8]
	# 	marker = "O"
	# 	assert_equal(3, Hard_cpu.new(game_array, marker).open_corners.count)

	# 	game_array = [0, 1, 2, 3, 4, "X", "O", 7, "O"]
	# 	marker = "X"
	# 	assert_equal(2, Hard_cpu.new(game_array, marker).open_corners.count)

	# 	game_array = [0, "O", 2, 3, "X", 5, 6, "X", 8]
	# 	marker = "O"
	# 	assert_equal(4, Hard_cpu.new(game_array, marker).open_corners.count)
	# end
	# def test_that_turn_returns_correct_number
	# 	game_array = [0, 1, 2, 3, 4, 5, 6, "X", 8]
	# 	marker = "X"
	# 	assert_equal(8, Hard_cpu.new(game_array, marker).turn.count)

	# 	game_array = ["X", 1, "O", 3, "X", 5, "O", 7, "X"]
	# 	marker = "X"
	# 	assert_equal(4, Hard_cpu.new(game_array, marker).turn.count)

	# 	game_array = ["X", 1, "O", 3, 4, 5, "X", 7, 8]
	# 	marker = "X"
	# 	assert_equal(6, Hard_cpu.new(game_array, marker).turn.count)
	# end	
	# def test_that_open_spaces_function_returns_correct
	# 	game_array = ["O", 1, 2, 3, 4, "X", 6, "X", 8]
	# 	marker = "X"
	# 	assert_equal(6, Hard_cpu.new(game_array, marker).open_spaces.count)

	# 	game_array = [0, 1, "O", "X", 4, 5, 6, 7, 8]
	# 	marker = "X"
	# 	assert_equal(7, Hard_cpu.new(game_array, marker).open_spaces.count)

	# 	game_array = [0, 1, 2, "X", "O", "O", "X", "O", "X"]
	# 	marker = "X"
	# 	assert_equal(3, Hard_cpu.new(game_array, marker).open_spaces.count)
	# end	
	# def test_that_cpu_marker_changes 
	# 	game_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	# 	marker = "O"
	# 	assert_equal("X", Hard_cpu.new(game_array, marker).cpu_marker)

	# 	game_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	# 	marker = "X"
	# 	assert_equal("O", Hard_cpu.new(game_array, marker).cpu_marker)
	# end	
	# def test_that_middle_corner_loop_works
	# 	game_array = ["O", 1, 2, 3, "X", 5, 6, 7, 8]
	# 	marker = "O"
	# 	assert_equal("8", Hard_cpu.new(game_array, marker).move)
	
	# 	game_array = [0, 1, "O", 3, "X", 5, 6, 7, 8]
	# 	marker = "O"
	# 	assert_equal("6", Hard_cpu.new(game_array, marker).move)

	# 	game_array = [0, 1, 2, 3, "O", 5, "X", 7, 8]
	# 	marker = "X"
	# 	assert_equal("2", Hard_cpu.new(game_array, marker).move)
	# end
	# def test_that_block_moves_loop_works
	# 	game_array = ["X", "X", 2, 3, "O", 5, 6, 7, 8]
	# 	marker = "X"
	# 	assert_equal("2", Hard_cpu.new(game_array, marker).move)

	# 	game_array = ["X", 1, "O", 3, "X", 5, 6, "O", 8]
	# 	marker = "X"
	# 	assert_equal("8", Hard_cpu.new(game_array, marker).move)

	# 	game_array = [0, 1, "X", 3, "O", "X", 6, 7, 8]
	# 	marker = "X"
	# 	assert_equal("8", Hard_cpu.new(game_array, marker).move)

	# 	game_array = ["O", "O", 2, 3, "X", 5, 6, 7, 8]
	# 	marker = "O"
	# 	assert_equal("2", Hard_cpu.new(game_array, marker).move)
	# end
	# def test_that_terminal_combos_works_for_blocking
	# 	game_array = ["X", 1, 2, 3, "O", 5, "X", 7, 8]
	# 	marker = "X"
	# 	assert_equal("3", Hard_cpu.new(game_array, marker).move)

	# 	game_array = [0, "O", "X", 3, "O", 5, 6, 7, 8]
	# 	marker = "O"
	# 	assert_equal("7", Hard_cpu.new(game_array, marker).move)

	# 	game_array = [0, 1, "O", 3, "X", 5, 6, 7, "X"]
	# 	marker = "X"
	# 	assert_equal("0", Hard_cpu.new(game_array, marker).move)

	# 	game_array = [0, 1, 2, 3, "X", 5, "O", "O", 8]
	# 	marker = "X"
	# 	assert_equal("8", Hard_cpu.new(game_array, marker).move)
	# end
	# def test_that_terminal_combos_works_for_winning_moves
	# 	game_array = ["O", "O", 2, 3, "X", 5, "X", "X", 8]
	# 	marker = "X"
	# 	assert_equal("2", Hard_cpu.new(game_array, marker).move)

	# 	game_array = ["X", 1, "O", 3, "O", "O", "X", 7, 8]
	# 	marker = "O"
	# 	assert_equal("3", Hard_cpu.new(game_array, marker).move)

	# 	game_array = [0, 1, "O", 3, "O", 5, 6, "X", "X"]
	# 	marker = "X"
	# 	assert_equal("6", Hard_cpu.new(game_array, marker).move)

	# 	game_array = [0, "O", "X", 3, "O", 5, 6, 7, "X"]
	# 	marker = "O"
	# 	assert_equal("5", Hard_cpu.new(game_array, marker).move)
	# end
	# def test_that_starting_moves_works_for_x_and_o
	# 	game_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	# 	marker = "O"
	# 	refute_equal("4", Hard_cpu.new(game_array, marker).open_corners)

	# 	game_array = ["X", 1, 2, 3, 4, 5, 6, 7, 8]
	# 	marker = "X"
	# 	assert_equal("4", Hard_cpu.new(game_array, marker).move)
	# end
	def test_that_will_take_random_corner_when_x_takes_middle	
		game_array = [0, 1, 2, 3, "X", 5, 6, 7, 8]
		marker = "X"
		refute_equal("1", Hard_cpu.new(game_array, marker).move)

		game_array = [0, 1, 2, 3, "X", 5, 6, 7, 8]
		marker = "X"
		refute_equal("3", Hard_cpu.new(game_array, marker).move)				
	
		game_array = [0, 1, 2, 3, "X", 5, 6, 7, 8]
		marker = "X"
		refute_equal("5", Hard_cpu.new(game_array, marker).move)

		game_array = [0, 1, 2, 3, "X", 5, 6, 7, 8]
		marker = "X"
		refute_equal("7", Hard_cpu.new(game_array, marker).move)
	end	
end