require './lib/grid'

describe 'Grid' do
  context "initialization" do
  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
  let(:grid)   { Grid.new(puzzle)}
  let(:puzzle_hard) { '800000000003600000070090200050007000000045700000100030001000068008500010090000400'}
  let(:grid_hard)   { Grid.new(puzzle_hard)}
  
  def values_for(cells)
    cells.map  {|c| c.value}
  end

  it 'should have 81 cells' do
    expect(grid.cells.length).to eq(81)
  end

   it 'should be split into an array of rows' do
    expect(values_for(grid.rows.first)).to eq [0, 1, 5, 0, 0, 3, 0, 0, 2]
   end

  it "should be able to know what is in the same column" do
      expect(values_for(grid.columns.first)).to eq [0,0,2,4,5,0,9,8,0]
  end

  it "should know the last value in each row to check last column" do
    expect(values_for(grid.columns.last)).to eq [2, 6, 0, 7, 0, 0, 0, 5, 0]
  end

  it "should be able to know what is in the first box" do
      expect(values_for(grid.boxes.first)).to eq [0,1,5,0,0,0,2,7,0]
  end

  it "should know what is in the last box " do
    cells = grid.boxes.last.map  {|c| c.value}
    expect(cells).to eq [0, 4, 0, 0, 2, 5, 6, 0, 0]
  end
  
  it "they are all zeroes" do
    cells = grid.each_empty_cell.map{|c| c.value}
    expect(cells.count).to eq 41
  end


  it "should know the missing values for cells row,column and box" do
    expect(grid.missing_values(grid.rows[0])).to eq [4,6,7,8,9]
    expect(grid.missing_values(grid.columns[0])).to eq [1,3,6,7]
    expect(grid.missing_values(grid.boxes[0])).to eq [3,4,6,8,9]
  end
  it "should locate a cell in the grid" do
    expect(grid.row_for_cell(grid.cells.first).collect{|cell| cell.value}).to eq [0,1,5,0,0,3,0,0,2]
    expect(grid.column_for_cell(grid.cells.first).collect{|cell| cell.value}).to eq [0,0,2,4,5,0,9,8,0]
    expect(grid.box_for_cell(grid.cells.first).collect{|cell| cell.value}).to eq [0,1,5,0,0,0,2,7,0]
  end

  it "should know what its candidates are"  do
    expect(grid.candidates_for_cell(grid.cells.first)).to eq [6]
  end
  it "should know if it is solved" do
    #the grid should return false if any of the cells are unsolved
    expect(grid.solved?).to eq(false)
    grid.solve!
    expect(grid.solved?).to eq(true)
  end
  it 'should make a deep copy of the grid' do
    grid1 = Grid.new(puzzle)
    grid2 = grid1.dup
    expect(grid1).not_to eq(grid2)
    expect(grid1.cells.map { |cell| cell.value }).to eq(grid2.cells.map { |cell| cell.value })
    grid2.cells[0].value = 2
    expect(grid1.cells.map { |cell| cell.value }).not_to eq(grid2.cells.map { |cell| cell.value })
    puts grid1.cells[0].value
  end

  it "should solve a hard problem" do
    #the grid should return false if any of the cells are unsolved
    expect(grid_hard.solved?).to eq(false)
    grid_hard.solve!
    expect(grid_hard.solved?).to eq(true)
  end
end
end



