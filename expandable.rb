class Board 
  def initialize()
    puts "Please enter board size you want minimum is 3:"
    @size = gets.chomp.to_i
    board_size
  end
  def board_size
    @board_array = Array.new(@size * @size)
  end
  attr_accessor :board_array
  attr_accessor :size
end