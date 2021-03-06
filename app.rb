require 'sinatra'
require_relative 'tic_tac_toe.rb'
require_relative 'expand.rb'
enable :sessions

get '/' do
	session[:board] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	session[:user1] = "Player 1"
	session[:user2] = "Player 2"
	erb :first_page, locals:{user1: session[:user1], board: session[:board]}
end
post '/game' do
	skill = params[:skill]
	size = params[:size]
	marker = params[:marker]
	session[:skill] = skill.to_i
	session[:marker] = marker
	erb :first_page, locals:{user1: session[:user1], board: session[:board], marker: session[:marker], skill: session[:skill], size: session[:size]}
	if skill == "4"
		session[:size] = size.to_i
		redirect '/expand'
	else	
		redirect '/ttt'
	end	
end
get '/expand' do
	user1 = session[:user1]
	size = session[:size]
	board_array = Array.new(size * size).map.with_index{ |x, i| i }
	session[:board_array] = board_array
	session[:the_end] = false
	erb :expand, locals:{size: session[:size], board_array: session[:board_array], the_end: session[:the_end], skill: session[:skill], user1: session[:user1]}
end
post '/expand' do
	board_array = session[:board_array]
	choice = params[:choice]
	board_array[choice.to_i] = "X"
	the_end = End_game.new(board_array).game_over
	if the_end == false
		board_array = Computer.new(board_array).board_array
		the_end = End_game.new(board_array).game_over
	end
	session[:board_array] = board_array
	session[:the_end] = the_end
	case session[:the_end]
		when "Player Wins"
			user1 = session[:user1]
			session[:the_end] = "#{user1} is the Winner"
		when "Computer Wins"
			session[:the_end] = "The Computer is the Winner"
		when	"Tie"
			session[:the_end] = "Game is a Tie"
	end
	erb :expand, locals:{board_array: session[:board_array], the_end: session[:the_end], skill: session[:skill], size: session[:size], user1: session[:user1]}	
end		
get '/ttt' do
	if session[:skill] == 0
		session[:marker] = "X"
	end	
	session[:board] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	if session[:marker] == "O" && session[:skill] > 0
		game_array = One_player.new(session[:skill], session[:board], session[:marker]).game_array
		session[:board] = game_array
	end	
	board = session[:board]
	erb :tic_tac_toe, locals:{user1: session[:user1], user2: session[:user2], board: session[:board], marker: session[:marker], skill: session[:skill]}
end	
post '/ttt' do
	board = session[:board]
	unless board.count > 9
		cell0 = params[:cell0]
		if cell0.class == String
			board[0] = cell0
		end
		cell1 = params[:cell1]
		if cell1.class == String
			board[1] = cell1
		end
		cell2 = params[:cell2]
		if cell2.class == String
			board[2] = cell2
		end
		cell3 = params[:cell3]
		if cell3.class == String
			board[3] = cell3
		end
		cell4 = params[:cell4]
		if cell4.class == String
			board[4] = cell4
		end
		cell5 = params[:cell5]
		if cell5.class == String
			board[5] = cell5
		end
		cell6 = params[:cell6]
		if cell6.class == String
			board[6] = cell6
		end
		cell7 = params[:cell7]
		if cell7.class == String
			board[7] = cell7
		end
		cell8 = params[:cell8]
		if cell8.class == String
			board[8] = cell8
		end
		session[:board] = board
		case session[:skill]
		when 0 then game_array = Winning.new(session[:board]).check_win
			if session[:marker] == "X"
				session[:marker] = "O"
			elsif session[:marker] == "O"
				session[:marker] = "X"
			end		
			if game_array.count == 10
				counter = 0
				game_array[0..8].each do |cell|				
					if cell.class == String
						counter += 1
					end
				end
				case counter.even?
					when true then game_array[10] = "#{session[:user2]} is the"
					when false then game_array[10] = "#{session[:user1]} is the"
				end	
			end
			counter = 0
			game_array.each do |cell|
				if cell == "X" || cell == "O"
					counter += 1
				end
			end
			if counter == 9 && game_array.count == 9
				game_array[9] = "Its a Tie"
			end	
		when 1,2,3 then game_array = Winning.new(session[:board]).check_win
			case game_array.count
			when 10 then
				game_array[10] = "#{session[:user1]} is the"
			when 9 then	game_array = One_player.new(session[:skill], session[:board], session[:marker]).game_array
				if game_array.count == 10
					game_array[10] = "The Computer is the"
				end	
			end
			counter = 0
			game_array.each do |cell|
				if cell == "X" || cell == "O"
					counter += 1
				end
			end
			if counter == 9 && game_array.count == 9
				game_array[9] = "Its a Tie"
			end	
		end			
		session[:board] = game_array
	end	
	erb :tic_tac_toe, locals:{user1: session[:user1], user2: session[:user2], board: session[:board], marker: session[:marker], skill: session[:skill]}
end