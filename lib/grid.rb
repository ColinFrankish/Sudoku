require_relative 'cell'

class Grid 

  attr_accessor :cells
  # reminder of what accessor does - its a method that can write and read to @cells!
  # def cells(cells)
  #   @cells = cells
  # end
  # def cells
  #   @cells
  # end

  def initialize(puzzle)
    @cells = puzzle.chars.map {|number| Cell.new(number.to_i)}
  end

  def rows
    @cells.each_slice(9).to_a
  end

  def columns
    rows.transpose
  end

  def box
    rows.map{|row| row.each_slice(3).to_a}.transpose.flatten.each_slice(9).to_a
  end
 
  def each_empty_cell
    #turn them into an array of elements (yes its DRY but roll with it!!)
    #the contents of the cell need to be indexed.. !!!
    
    #iterate over each element and return it if it equals zero 
    @cells.select { |c| c.zero?  }
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
