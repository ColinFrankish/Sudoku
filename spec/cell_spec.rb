require './lib/cell'
require './lib/grid'


describe 'cell' do 
  let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
  let(:grid) {Grid.new(puzzle)}
  # let(:cell) {Cell.new(0, puzzle)}
  
  #let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
  
 it "should know if it is solved " do
      expect(grid.cells.first.solved?).to be_false
  end

 

  
end


#puzzle = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
#grid = Grid.new(puzzle)
#cell = grid.cells.first
#cell.to_s
#grid.rows.select{|row| row.include? cell }    (.count)
#grid.columns.select{|row| row.include? cell }
#grid.box.select{|row| row.include? cell }

#...........
#def nei_for(cell, grid)
# row = grid.rows.select{|row| row.include? cell }
# col = grid.columns.select{|row| row.include? cell }
# box = grid.box.select{|row| row.include? cell }
# row + col + box
# end

#nei_for(cell, grid).flatten
#nei_for(cell, grid).flatten.map{|cell| cell.value }.uniq
#(1..9).to_a - [0, 1, 5, 3, 2, 4, 9, 8, 7]
#cell = grid.cells[3]
#cell = grid.cells[4]
#cell = grid.cells[7]
#c = grid.cells[67]
# grid.cells.index(c)
# ==> 67