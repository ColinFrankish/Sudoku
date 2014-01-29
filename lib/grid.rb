class Grid 

  attr_reader :cells
  # def cells
  #   @cells
  # end

  def initialize(puzzle)
    @cells = puzzle
  end

  def rows
    @cells.split(//).map(&:to_i).each_slice(9).to_a
  end

  def columns
    rows.transpose
  end

  def box
    rows.map{|row| row.each_slice(3).to_a}.transpose.flatten.each_slice(9).to_a

  end
 




  # def solve
  #   # outstanding_before, looping = SIZE, false
  #   # while !solved? && !looping
  #   #   try_to_solve # ask each cell to solve itself
  #   #   outstanding         = @cells.count {|c| c.solved? }
  #   #   looping             = outstanding_before == outstanding       
  #   #   outstanding_before  = outstanding 
  # end

  # def solved? 

  # end

  # def inspect

  # end

end
