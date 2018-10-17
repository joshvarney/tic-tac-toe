class Board 
  def initialize(argument)
    if argument.class == Array
      @board_array = argument 
      @size = Math.sqrt(@board_array.count).to_i
    else
      @size = argument
      @board_array = board_size
    end 
    draw_board
  end
  def board_size
    array = Array.new(@size * @size).map.with_index{ |x, i| i }
    array  
  end
  def draw_board
    @grid = ""
    counter = 0
    @board_array.each_with_index do |cell, index|
      if cell.class == String
        @grid << " #{@board_array[index]} "
      elsif cell >= 0 && cell < 10
        @grid << " #{index} "
      elsif cell >= 10 && cell < 100  
        @grid << " #{index}"
      elsif cell >= 100 && cell < 1000
        @grid << "#{index}"
      else
        @grid << "#{index}"  
      end    
        case counter 
        when 0..@size-2 then grid << "|" 
        when @size-1 then
          count = 1 
          @size.times do
            case count
            when 1 then grid << "\n----" unless index == @board_array.count - 1
            when 2..@size-1 then grid << "----" unless index == @board_array.count - 1
            when @size then grid << "---\n" unless index == @board_array.count - 1
            end    
            count += 1
          end  
        end
      counter += 1
      if counter == @size
        counter = 0
      end
    end 
    @grid
  end
  attr_accessor :grid 
  attr_accessor :board_array
  attr_accessor :size
end
class End_game
  def initialize(board_array)
    @board_array = board_array
    tie = check_tie
    if tie == false
      win = check_winner
    end
    if win == false && tie == false
      @game_over = false
    elsif tie == true
      @game_over = "Tie"
    else
      @game_over = win
    end
  end
  def check_tie
    that = @board_array.count
    counter = 0
    @board_array.each do |x|
      if x.class == String
        counter += 1
      end  
    end
    if counter == that  
      return true
    else 
      return false
    end   
  end
  def check_winner
    size = Math.sqrt(@board_array.count).to_i
    smaller = size - 1
    @row_group = @board_array.each_slice(size).to_a
    index_array = @board_array.map.with_index{ |x, i| i }
    column_group = []
    diagonal_group = []
    counter = 0
    size.times do
      column_group << @board_array[counter]
      count = counter
      smaller.times do
        column_group << @board_array[count + size]
        count = index_array[count + size]
      end
      counter += 1       
    end
    counter = 0
    2.times do 
      diagonal_group << @board_array[counter]
      count = counter
      smaller.times do
        if counter == 0 
          diagonal_group << @board_array[count + size + 1]
          count = index_array[count + size + 1]
        elsif counter == size - 1
          diagonal_group << @board_array[count + size -1]
          count = index_array[count + size - 1]
        end
      end
      counter = size - 1
    end
    @column_group = column_group.each_slice(size).to_a 
    @diagonal_group = diagonal_group.each_slice(size).to_a
    winning_groups = @row_group + @diagonal_group + @column_group
    the_answer = winning_loop(winning_groups)
    if the_answer == false
      return false
    else
      return the_answer
    end    
  end
  def winning_loop(winning_groups)
    game_time = false
    winning_groups.each do |groups|
      if groups.uniq.count == 1 && groups.uniq == ["X"]
        game_time = "Player Wins"
        break
      elsif groups.uniq.count == 1 && groups.uniq == ["O"]
        game_time = "Computer Wins"
        break   
      end
    end
    return game_time
  end      
  attr_accessor :game_over
  attr_accessor :column_group
  attr_accessor :diagonal_group
  attr_accessor :row_group
end            
class One_player
  def initialize(grid, board_array)
    @grid = grid
    @board_array = board_array
    play_game
  end
  def play_game
    board_array = @board_array
    whatever = End_game.new(board_array).game_over
    system "cls"
		puts " "
		puts "Varney's TTT"
		puts " "
		puts @grid
    puts " "
    if whatever == false
      puts "Select number of your move:"
      move = gets.chomp
      move1 = move.to_i
      if move1 == 0 && move != "0"
        puts "Invalid Entry try Again"
        sleep 1
        play_game
      end
      move = move.to_i  
      if board_array.include?(move) == false
        puts "Invalid Entry try Again"
        sleep 1
        play_game
      end
      update_array = Human.new(move, board_array)
      update_array = update_array.board_array
      whatever = End_game.new(update_array).game_over
      if whatever == false
        things = Computer.new(update_array).board_array
      else
        things = update_array
      end  
      stuff = Board.new(things)
      @grid = stuff.grid
      @board_array = stuff.board_array
      play_game
    else
      puts "Game Over #{whatever}"
      puts " "
    end    
  end
end
class Human
  def initialize(move, board_array)
    move = move.to_i
    marker = "X"
    @board_array = board_array
    if @board_array.include?(move)
      @board_array.each do |cell|
        if cell == move
          @board_array[cell] = marker
          break
        end
      end
    end  
    @board_array
  end  
  attr_accessor :board_array
end
class Computer
  def initialize(board_array)
    @board_array = board_array
    build_middle_array
    terminal_arrays
    player_moves
    computer_move
  end
  def player_moves
    @pmoves = []
    @board_array.each_with_index do |x, i|
      unless x != "X"
        @pmoves << i
      end
    end
    return @pmoves
  end
  def build_middle_array
    if @board_array.count.even? == true
      size = Math.sqrt(@board_array.count).to_i
      middle = @board_array.count / 2
      here = size / 2
      @middle_array = []
      @middle_array << middle - here
      @middle_array << middle - here - 1
      @middle_array << middle + here 
      @middle_array << middle + here - 1
      @middle_array = @middle_array.shuffle!
    end
  end    
  def terminal_arrays
    size = Math.sqrt(@board_array.count).to_i
    smaller = size - 1
    row_group = @board_array.each_slice(size).to_a
    index_array = @board_array.map.with_index{ |x, i| i }
    column_group = []
    column_group = column_group.each_slice(size).to_a
    diagonal_group = []
    counter = 0
    size.times do
      column_group << @board_array[counter]
      count = counter
      smaller.times do
        column_group << @board_array[count + size]
        count = index_array[count + size]
      end
      counter += 1       
    end
    counter = 0
    2.times do 
      diagonal_group << @board_array[counter]
      count = counter
      smaller.times do
        if counter == 0 
          diagonal_group << @board_array[count + size + 1]
          count = index_array[count + size + 1]
        elsif counter == size - 1
          diagonal_group << @board_array[count + size -1]
          count = index_array[count + size - 1]
        end
      end
      counter = size - 1
    end
    column_group = column_group.each_slice(size).to_a 
    diagonal_group = diagonal_group.each_slice(size).to_a
    @winning_groups = row_group + diagonal_group + column_group
    @winning_groups
  end  
  def computer_move
    size = Math.sqrt(@board_array.count).to_i
    if @board_array.count.odd? == true
      center = @board_array.count - 1
      center = center / 2
      if @board_array.include?(center)
        @board_array[center] = "O"
        return @board_array
      end
    end          
    @winning_groups.each do |that|
      if that.uniq.length == 2 && that.uniq[1].class == Integer
        @board_array[that.uniq[1]] = "O"
        return @board_array
        break
      elsif that.uniq.length == 2 && that.uniq[0].class == Integer
        @board_array[that.uniq[0]] = "O"
        return @board_array
        break
      end
    end
    @winning_groups.each do |that|
      if that.uniq.length == 3 && that.uniq[0].class == Integer
        @board_array[that.uniq[0]] = "O"
        return @board_array
        break
      elsif that.uniq.length == 3 && that.uniq[1].class == Integer
        @board_array[that.uniq[1]] = "O"
        return @board_array
        break
      elsif that.uniq.length == 3 && that.uniq[2].class == Integer
        @board_array[that.uniq[2]] = "O"
        return @board_array
        break  
      end
    end
    if @board_array.count.even? == true
        @middle_array.each do |cell|
        if @board_array.include?(cell)
          @board_array[cell] = "O"
          return @board_array
          break
        end
      end
    end             
    counter = 0 
    @board_array.each do |c|
      if c.class == Integer
        @board_array[counter] = "O"
        return @board_array
        break
      end
      counter += 1
    end  
  end
  attr_reader :board_array
end      
class The_game
  def initialize()
    system "cls"
		puts " "
		puts "Varney's TTT"
		puts " "
		puts "Select Board size 4 x 4 up to 31 x 31:"
		puts " "
    size = gets.chomp.to_i
    if size > 3 && size < 32
      stuff = Board.new(size)
      grid = stuff.grid
      board_array = stuff.board_array
      One_player.new(grid, board_array)
    else
      puts "Try another number"
      sleep 1
      The_game.new
    end    
  end
end
The_game.new
