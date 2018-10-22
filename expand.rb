class Build_array
  def initialize(board_array)
      @board_array = board_array
      build_middle_array
      array_builder
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
  def array_builder
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
    @size = size
    @column_group = column_group.each_slice(size).to_a 
    @diagonal_group = diagonal_group.each_slice(size).to_a
    @winning_groups = @row_group + @diagonal_group + @column_group
  end
  attr_accessor :size
  attr_accessor :column_group
  attr_accessor :diagonal_group
  attr_accessor :row_group
  attr_accessor :winning_groups
  attr_accessor :middle_array
end    
class Computer
  def initialize(board_array)
    things = Build_array.new(board_array)
    @winning_groups = things.winning_groups
    @middle_array = things.middle_array
    @board_array = board_array
    player_moves
    computer_move
  end
  def player_moves
    @pmoves = []
    @these_moves = []
    size = Math.sqrt(@board_array.count).to_i
    big_num = @board_array.count.to_i
    @board_array.each_with_index do |x, i|
      unless x != "X"
        @pmoves << i
        first = i + 1
        second = i - 1
        third = i + size
        fourth = i - size
        fifth = i + size + 1
        sixth = i + size - 1
        seventh = i - size + 1
        eighth = i - size - 1
        if first >= 0 && first <= big_num
          @these_moves << first
        end
        if second >= 0 && second <= big_num
          @these_moves << second
        end
        if third >= 0 && third <= big_num
          @these_moves << third
        end
        if fourth >= 0 && fourth <= big_num
          @these_moves << fourth
        end
        if fifth >= 0 && fifth <= big_num
          @these_moves << fifth
        end
        if sixth >= 0 && sixth <= big_num
          @these_moves << sixth
        end
        if seventh >= 0 && seventh <= big_num
          @these_moves << seventh
        end
        if eighth >= 0 && eighth <= big_num
          @these_moves << eighth
        end    
      end
    end
    @these_moves
    @pmoves
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
    @these_moves = @these_moves.shuffle!
    @these_moves.each do |x|
      if @board_array.include?(x) 
        @board_array[x] = "O"
        return @board_array
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
  attr_accessor :these_moves
  attr_accessor :pmoves
  attr_reader :board_array
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
    board_array = @board_array
    winning_groups = Build_array.new(board_array).winning_groups
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
end 