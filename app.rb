require 'sinatra'
require 'mysql2'
require_relative 'tic_tac_toe.rb'
require_relative 'expand.rb'
enable :sessions
load 'local_ENV.rb' if File.exist?('local_ENV.rb')
client = Mysql2::Client.new(:username => ENV['RDS_USERNAME'], :password => ENV['RDS_PASSWORD'], :host => ENV['RDS_HOSTNAME'], :port => ENV['RDS_PORT'], :database => ENV['RDS_DB_NAME'], :socket => '/tmp/mysql.sock')


get '/' do
	if session[:error] != "Account Created"
		session[:error] = " "
	end	
	erb :login, locals:{error: session[:error]}
end
post '/login' do
	user1 = params[:user1]
	user2 = params[:user2]
	pass1 = params[:pass1]
	pass2 = params[:pass2]
	type = params[:type]
	user1 = client.escape(user1)
	unless user2 == nil
		user2 = client.escape(user2)
	end
	results1 = client.query("SELECT * FROM ttt_table WHERE `user` = '#{user1}'")
	results2 = client.query("SELECT * FROM ttt_table WHERE `user` = '#{user2}'")
	user1_info = []
	results1.each do |row|
		user1_info << [[row['user']], [row['pass']]]
	end		
	user2_info = []
	results2.each do |row|
		user2_info << [[row['user']], [row['pass']]]
	end
		if user1_info.count == 0
 			session[:error] = "Invalid Login"
 		elsif user1 == user1_info[0][0][0] && pass1 != user1_info[0][1][0]
 			session[:error] = "Invalid Password"	 
		elsif user1 == user1_info[0][0][0] && pass1 == user1_info[0][1][0] && user2 == nil
			session[:user1] = user1
			session[:type] = type
			session[:error] = " "
			redirect '/game'
		elsif user2_info.count == 0
			session[:error] = "Invalid Login Player 2"
		elsif user2 == user2_info[0][0][0] && pass2 != user2_info[0][1][0]
			session[:error] = "Invalid Password Player 2"
		elsif user1 == user1_info[0][0][0] && pass1 == user1_info[0][1][0] &&  user2 == user2_info[0][0][0] && pass2 == user2_info[0][1][0]
			session[:error] = " "
			session[:user1] = user1
			session[:user2] = user2
			session[:board] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
			session[:type] = type
			session[:skill] = 0
			session[:marker] = "X"
			redirect '/ttt'
		end	
	erb :login, locals:{user1: session[:user1], user2: session[:user2], type: session[:type], error: session[:error]}
end
get '/create_account' do
	erb :create_account, locals:{error: session[:error]}
end
post '/create_account' do
	user = params[:user]
	pass = params[:pass]
	cpass = params[:cpass]
	results = client.query("SELECT * FROM ttt_table")
	user_info = []
	results.each do |row|
		user_info << row['user']
	end
	user_info.each do |stuff|
		if user == stuff
			session[:error] = "User Name Taken"
			redirect '/create_account'
		end
	end	
	if pass != cpass
			session[:error] = "Passwords Don't Match"
			redirect '/create_account'
	else
		user = client.escape(user)
		pass = client.escape(pass)  
		client.query("INSERT INTO ttt_table(user, pass)
  		VALUES('#{user}', '#{pass}')")
   		session[:error] = "Account Created"
   		redirect '/'
  end	
end
get '/game' do
	session[:board] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
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
	size = session[:size]
	board_array = Array.new(size * size).map.with_index{ |x, i| i }
	session[:board_array] = board_array
	session[:the_end] = false
	erb :expand, locals:{size: session[:size], board_array: session[:board_array], the_end: session[:the_end], skill: session[:skill]}
end
post '/expand' do
	board_array = session[:board_array]
	choice = params[:choice]
	p choice
	p board_array
	board_array[choice.to_i] = "X"
	p board_array
	the_end = End_game.new(board_array).game_over
	if the_end == false
		board_array = Computer.new(board_array).board_array
		the_end = End_game.new(board_array).game_over
	end
	session[:board_array] = board_array
	session[:the_end] = the_end
	erb :expand, locals:{board_array: session[:board_array], the_end: session[:the_end], skill: session[:skill], size: session[:size]}	
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
						user2_win = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user2]}'")
						user2_win_array = []
						user2_win.each do |row|
							user2_win_array << [[row['pvp wins']], [row['pvp games']], [row['total games']]]
						end
						win_user2 = user2_win_array[0][0][0].to_i + 1
						games_user2 = user2_win_array[0][1][0].to_i + 1
						tgames_user2 = user2_win_array[0][2][0].to_i + 1
			  			client.query("UPDATE `ttt_table` SET `pvp wins`='#{win_user2}' WHERE `user`='#{session[:user2]}'")
						client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user2}' WHERE `user`='#{session[:user2]}'")
						client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user2}' WHERE `user`='#{session[:user2]}'")
						user1_loss = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
						user1_loss_array = []
						user1_loss.each do |row|
							user1_loss_array << [[row['pvp loss']], [row['pvp games']], [row['total games']]]
						end
						loss_user1 = user1_loss_array[0][0][0].to_i + 1
						games_user1 = user1_loss_array[0][1][0].to_i + 1
						tgames_user1 = user1_loss_array[0][2][0].to_i + 1
			  			client.query("UPDATE `ttt_table` SET `pvp loss`='#{loss_user1}' WHERE `user`='#{session[:user1]}'")
						client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user1}' WHERE `user`='#{session[:user1]}'")
						client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user1}' WHERE `user`='#{session[:user1]}'") 
					when false then game_array[10] = "#{session[:user1]} is the"
						user1_win = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
						user1_win_array = []
						user1_win.each do |row|
							user1_win_array << [[row['pvp wins']], [row['pvp games']], [row['total games']]]
						end
						win_user1 = user1_win_array[0][0][0].to_i + 1
						games_user1 = user1_win_array[0][1][0].to_i + 1
						tgames_user1 = user1_win_array[0][2][0].to_i + 1
			  			client.query("UPDATE `ttt_table` SET `pvp wins`='#{wins_user1}' WHERE `user`='#{session[:user1]}'")
						client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user1}' WHERE `user`='#{session[:user1]}'")
						client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user1}' WHERE `user`='#{session[:user1]}'")
						user2_loss = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user2]}'")
						user2_loss_array = []
						user2_loss.each do |row|
							user2_loss_array << [[row['pvp loss']], [row['pvp games']], [row['total games']]]
						end
						loss_user2 = user2_loss_array[0][0][0].to_i + 1
						games_user2 = user2_loss_array[0][1][0].to_i + 1
						tgames_user2 = user2_loss_array[0][2][0].to_i + 1
			  			client.query("UPDATE `ttt_table` SET `pvp loss`='#{loss_user2}' WHERE `user`='#{session[:user2]}'")
						client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user2}' WHERE `user`='#{session[:user2]}'")
						client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user2}' WHERE `user`='#{session[:user2]}'")
				end	
			end
			counter = 0
			game_array.each do |cell|
				if cell == "X" || cell == "O"
					counter += 1
				end
			end
			if counter == 9 && game_array.count == 9
				user1_tie = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
				user1_tie_array = []
				user1_tie.each do |row|
					user1_tie_array << [[row['pvp ties']], [row['pvp games']], [row['total games']]]
				end
				tie_user1 = user1_tie_array[0][0][0].to_i + 1
				games_user1 = user1_tie_array[0][1][0].to_i + 1
				tgames_user1 = user1_tie_array[0][2][0].to_i + 1
	 			client.query("UPDATE `ttt_table` SET `pvp ties`='#{tie_user1}' WHERE `user`='#{session[:user1]}'")
				client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user1}' WHERE `user`='#{session[:user1]}'")
				client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user1}' WHERE `user`='#{session[:user1]}'")
				user2_tie = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user2]}'")
				user2_tie_array = []
				user2_tie.each do |row|
					user2_tie_array << [[row['pvp ties']], [row['pvp games']], [row['total games']]]
				end
				tie_user2 = user2_tie_array[0][0][0].to_i + 1
				games_user2 = user2_tie_array[0][1][0].to_i + 1
				tgames_user2 = user2_tie_array[0][2][0].to_i + 1
				client.query("UPDATE `ttt_table` SET `pvp ties`='#{tie_user2}' WHERE `user`='#{session[:user2]}'")
				client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user2}' WHERE `user`='#{session[:user2]}'")
				client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user2}' WHERE `user`='#{session[:user2]}'")
				game_array[9] = "Its a Tie"
			end	
		when 1,2,3 then game_array = Winning.new(session[:board]).check_win
			case game_array.count
			when 10 then
				unless session[:skill] < 3
					hard_win = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
					hard_win_array = []
					hard_win.each do |row|
						hard_win_array << [[row['hard wins']], [row['hard games']], [row['total games']]]
					end
					win = hard_win_array[0][0][0].to_i + 1
					games = hard_win_array[0][1][0].to_i + 1
					tgames = hard_win_array[0][2][0].to_i + 1
		  			client.query("UPDATE `ttt_table` SET `hard wins`='#{win}' WHERE `user`='#{session[:user1]}'")
					client.query("UPDATE `ttt_table` SET `hard games`='#{games}' WHERE `user`='#{session[:user1]}'")
					client.query("UPDATE `ttt_table` SET `total games`='#{tgames}' WHERE `user`='#{session[:user1]}'") 
				end
				game_array[10] = "#{session[:user1]} is the"
			when 9 then	game_array = One_player.new(session[:skill], session[:board], session[:marker]).game_array
				if game_array.count == 10
					unless session[:skill] < 3
						hard_loss = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
						hard_loss_array = []
						hard_loss.each do |row|
							hard_loss_array << [[row['hard loss']], [row['hard games']], [row['total games']]]
						end
						loss = hard_loss_array[0][0][0].to_i + 1
						games = hard_loss_array[0][1][0].to_i + 1
						tgames = hard_loss_array[0][2][0].to_i + 1
		  				client.query("UPDATE `ttt_table` SET `hard loss`='#{loss}' WHERE `user`='#{session[:user1]}'")
						client.query("UPDATE `ttt_table` SET `hard games`='#{games}' WHERE `user`='#{session[:user1]}'")
						client.query("UPDATE `ttt_table` SET `total games`='#{tgames}' WHERE `user`='#{session[:user1]}'")
					end
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
				unless session[:skill] < 3
					hard_tie = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
					hard_tie_array = []
					hard_tie.each do |row|
						hard_tie_array << [[row['hard ties']], [row['hard games']], [row['total games']]]
					end
					ties = hard_tie_array[0][0][0].to_i + 1
					games = hard_tie_array[0][1][0].to_i + 1
					tgames = hard_tie_array[0][2][0].to_i + 1
	  				client.query("UPDATE `ttt_table` SET `hard ties`='#{ties}' WHERE `user`='#{session[:user1]}'")
					client.query("UPDATE `ttt_table` SET `hard games`='#{games}' WHERE `user`='#{session[:user1]}'")
					client.query("UPDATE `ttt_table` SET `total games`='#{tgames}' WHERE `user`='#{session[:user1]}'")
				end
				game_array[9] = "Its a Tie"
			end	
		end			
		session[:board] = game_array
	end	
	erb :tic_tac_toe, locals:{user1: session[:user1], user2: session[:user2], board: session[:board], marker: session[:marker], skill: session[:skill]}
end
get '/stats' do
	results = client.query("SELECT * FROM ttt_table")
	results_table = []
	results.each do |row|
		results_table << [[row['user']], [row['pvp wins']], [row['pvp loss']], [row['pvp ties']], [row['pvp games']], [row['hard wins']], [row['hard loss']], [row['hard ties']], [row['hard games']], [row['total games']]]
	end
	session[:results_table] = results_table
	erb :stats, locals:{user1: session[:user1], user2: session[:user2], results_table: session[:results_table]}
end	