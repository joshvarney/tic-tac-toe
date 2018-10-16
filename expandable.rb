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
class One_player
  def initialize(grid, board_array)
    @grid = grid
    @board_array = board_array
    play_game
  end
  def play_game
    system "cls"
		puts " "
		puts "Varney's TTT"
		puts " "
		puts @grid
		puts " "
    puts "Select number of your move:"
    move = gets.chomp.to_i
    board_array = @board_array
    update_array = Human.new(move, board_array)
    update_array = update_array.board_array
    stuff = Board.new(update_array)
    @grid = stuff.grid
    @board_array = stuff.board_array
    play_game
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
      sleep 1.5
      The_game.new
    end    
  end
end
The_game.new
