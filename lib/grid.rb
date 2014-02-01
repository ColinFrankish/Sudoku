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

  def boxes
    rows.map{|row| row.each_slice(3).to_a}.transpose.flatten.each_slice(9).to_a
  end
 
  def each_empty_cell
    #iterate over each element and return it if it equals zero 
    @cells.select { |c| !c.solved?  }
  end

  def missing_values(cells)
    (1..9).to_a - cells.collect{|cell| cell.value}
  end

  def row_for_cell(cell)
    rows.detect{|row| row.include? cell }
  end

  def column_for_cell(cell)
    columns.detect{|column| column.include? cell}
  end

  def box_for_cell(cell)
    boxes.detect{|box| box.include? cell}
  end

  def candidates_for_cell(cell)
    row = row_for_cell(cell).collect{|cell| cell.value}
    col = column_for_cell(cell).collect{|cell| cell.value}
    box = box_for_cell(cell).collect{|cell| cell.value}
    
    (1..9).to_a - row - col - box
  end

  def solved?
    @cells.all?(&:solved?)
  end

  def solve!
    row = rows.first.map {|cell| cell.value}
    if row != [8, 1, 2, 3, 5, 4, 6, 7, 9]
      print row
      puts ''
    end
    while not solved?
      # puts "Beginning iteration..."
      changes_made = false
      
      @cells.each do |cell|
        # puts 'cell already solved, skipping' if cell.solved?
        next if cell.solved?
        
        candidates = candidates_for_cell(cell)

        # puts candidates.length == 1 ? 'Found one possible solution for cell' : 'Multiple options found for cell OMG'
        if candidates.length == 0
          return        
        elsif candidates.length == 1 
          cell.value = candidates.first
          changes_made = true
        end
      end

      if not changes_made
        try_harder
        return
      end
    end

    if solved?
      rows.each do |row|
        row.each{|cell| print cell.value}
        puts ""
      end
    end
  end

  def try_harder
    if false
      rows.each do |row|
        row.each{|cell| print cell.value}
        puts ""
      end
      puts ''
    end

    # puts 'Trying harder'
    @cells.each_with_index do |cell, cell_index| 
      if not cell.solved?
        candidates = self.candidates_for_cell(cell)
      
        for candidate in candidates do
          new_grid = self.dup
          new_grid.cells[cell_index].value = candidate 
          new_grid.solve!

          return if new_grid.solved?
        end
      end
    end

  end

  def dup
    copy = super
    copy.cells = @cells.map {|cell| cell.dup}
    return copy
  end

  #

end
