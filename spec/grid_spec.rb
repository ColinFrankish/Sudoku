require './lib/grid'

describe 'Grid' do
  context "initialization" do
  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
  let(:grid)   { Grid.new(puzzle)}

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




  # it "should know what its candidates are"  do

  #   expect(grid.cells.first.candidates).to eq[6]
  # end

end
end



