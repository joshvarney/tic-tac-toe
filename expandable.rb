class Board 
  def initialize()
    puts "Please enter board size you want minimum is 3:"
    @size = gets.chomp.to_i
    return @size
  end
  attr_accessor :size
end