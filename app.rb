require 'sinatra'
require_relative 'tic_tac_toe.rb'
enable :sessions

get '/' do
	marker = "X"
	skill = 3
	# marker = params[:marker]
	session[:skill] = skill
	session[:marker] = marker
	session[:board] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	erb :tic_tac_toe, locals:{board: session[:board], marker: session[:marker], skill: session[:skill]}
end
post '/ttt' do
	board = session[:board]
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
	game_array = Winning.new(session[:board])
	if game_array.count == 9
		game_array = One_player.new(session[:skill], session[:board], session[:marker]).game_array
	end
	session[:board] = game_array
	erb :tic_tac_toe, locals:{board: session[:board], marker: session[:marker], skill: session[:skill]}
end