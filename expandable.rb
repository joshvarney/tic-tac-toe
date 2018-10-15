class Board 
  def initialize()
    puts "Please enter board size you want minimum is 3:"
    @size = gets.chomp.to_i
    board_size
    draw_board
  end
  def board_size
    @board_array = Array.new(@size * @size).map.with_index{ |x, i| i }
    @board_array
  end
  def draw_board
    @grid = ""
    counter = 0
    @board_array.each_with_index do |cell, index|
      @grid << " #{@board_array[index]} "
        case counter 
        when 0..@size-2 then grid << "|"
        when @size-1 then grid << "\n------------\n" unless index == @board_array.count - 1
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
puts Board.new.grid