# app rb line 197

# case counter.even?
# when true then game_array[10] = "#{session[:user2]} is the"
#   user2_win = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user2]}'")
#   user2_win_array = []
#   user2_win.each do |row|
#     user2_win_array << [[row['pvp wins']], [row['pvp games']], [row['total games']]]
#   end
#   win_user2 = user2_win_array[0][0][0].to_i + 1
#   games_user2 = user2_win_array[0][1][0].to_i + 1
#   tgames_user2 = user2_win_array[0][2][0].to_i + 1
#   client.query("UPDATE `ttt_table` SET `pvp wins`='#{win_user2}' WHERE `user`='#{session[:user2]}'")
#   client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user2}' WHERE `user`='#{session[:user2]}'")
#   client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user2}' WHERE `user`='#{session[:user2]}'")
#   user1_loss = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
#   user1_loss_array = []
#   user1_loss.each do |row|
#     user1_loss_array << [[row['pvp loss']], [row['pvp games']], [row['total games']]]
#   end
#   loss_user1 = user1_loss_array[0][0][0].to_i + 1
#   games_user1 = user1_loss_array[0][1][0].to_i + 1
#   tgames_user1 = user1_loss_array[0][2][0].to_i + 1
#     client.query("UPDATE `ttt_table` SET `pvp loss`='#{loss_user1}' WHERE `user`='#{session[:user1]}'")
#   client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user1}' WHERE `user`='#{session[:user1]}'")
#   client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user1}' WHERE `user`='#{session[:user1]}'") 
# when false then game_array[10] = "#{session[:user1]} is the"
#   user1_win = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
#   user1_win_array = []
#   user1_win.each do |row|
#     user1_win_array << [[row['pvp wins']], [row['pvp games']], [row['total games']]]
#   end
#   win_user1 = user1_win_array[0][0][0].to_i + 1
#   games_user1 = user1_win_array[0][1][0].to_i + 1
#   tgames_user1 = user1_win_array[0][2][0].to_i + 1
#     client.query("UPDATE `ttt_table` SET `pvp wins`='#{wins_user1}' WHERE `user`='#{session[:user1]}'")
#   client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user1}' WHERE `user`='#{session[:user1]}'")
#   client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user1}' WHERE `user`='#{session[:user1]}'")
#   user2_loss = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user2]}'")
#   user2_loss_array = []
#   user2_loss.each do |row|
#     user2_loss_array << [[row['pvp loss']], [row['pvp games']], [row['total games']]]
#   end
#   loss_user2 = user2_loss_array[0][0][0].to_i + 1
#   games_user2 = user2_loss_array[0][1][0].to_i + 1
#   tgames_user2 = user2_loss_array[0][2][0].to_i + 1
#     client.query("UPDATE `ttt_table` SET `pvp loss`='#{loss_user2}' WHERE `user`='#{session[:user2]}'")
#   client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user2}' WHERE `user`='#{session[:user2]}'")
#   client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user2}' WHERE `user`='#{session[:user2]}'")
# end	
# end


# app rb line 209

# user1_tie = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user1]}'")
# user1_tie_array = []
# user1_tie.each do |row|
#   user1_tie_array << [[row['pvp ties']], [row['pvp games']], [row['total games']]]
# end
# tie_user1 = user1_tie_array[0][0][0].to_i + 1
# games_user1 = user1_tie_array[0][1][0].to_i + 1
# tgames_user1 = user1_tie_array[0][2][0].to_i + 1
#  client.query("UPDATE `ttt_table` SET `pvp ties`='#{tie_user1}' WHERE `user`='#{session[:user1]}'")
# client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user1}' WHERE `user`='#{session[:user1]}'")
# client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user1}' WHERE `user`='#{session[:user1]}'")
# user2_tie = client.query("SELECT * FROM ttt_table WHERE `user` = '#{session[:user2]}'")
# user2_tie_array = []
# user2_tie.each do |row|
#   user2_tie_array << [[row['pvp ties']], [row['pvp games']], [row['total games']]]
# end
# tie_user2 = user2_tie_array[0][0][0].to_i + 1
# games_user2 = user2_tie_array[0][1][0].to_i + 1
# tgames_user2 = user2_tie_array[0][2][0].to_i + 1
# client.query("UPDATE `ttt_table` SET `pvp ties`='#{tie_user2}' WHERE `user`='#{session[:user2]}'")
# client.query("UPDATE `ttt_table` SET `pvp games`='#{games_user2}' WHERE `user`='#{session[:user2]}'")
# client.query("UPDATE `ttt_table` SET `total games`='#{tgames_user2}' WHERE `user`='#{session[:user2]}'")