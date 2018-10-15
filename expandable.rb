class Board 
  def initialize()
    puts "Please enter board size you want minimum is 3:"
    @size = gets.chomp.to_i
    board_size
    draw_board
  end
  def board_size
    if @board_array == nil
      @board_array = Array.new(@size * @size).map.with_index{ |x, i| i }
    else
      @board_array = @board_array
    end
    @board_array  
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
class Human
  def initialize()
    @board_array = Board.new.board_array
    human_move
  end
  def human_move
    marker = "X"
    puts Board.new.grid
    puts "Enter number for your move:"
    move = gets.chomp
    @board_array.each do |cell|
      if cell == move.to_i
        @board_array[cell] = marker
        break
      end
    end
    @board_array   
  end  
  attr_accessor :board_array
end
Human.new  