require './lib/grid'

describe 'Grid' do
  context "initialization" do
  let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
  let(:grid) {Grid.new(puzzle)}

  it 'should have 81 cells' do
    grid = Grid.new(puzzle)
    # check the length of the numbers in the puzzle including the blanks
    #check the length of the puzzle hash is 81
    expect(grid.cells.length).to eq(81)
  end

   it 'should be split into an array of rows' do
    expect(grid.rows.first).to eq [0, 1, 5, 0, 0, 3, 0, 0, 2]
    # expect(grid.rows.(puzzle[0])).to eq(0)
   end

  it "should be able to know what is in the same column" do
      expect(grid.columns.first).to eq [0,0,2,4,5,0,9,8,0]
  end

  it "should know the last value in each row to check last column" do
    expect(grid.columns.last).to eq [2, 6, 0, 7, 0, 0, 0, 5, 0]
  end

  it "should be able to know what is in the first box" do
      expect(grid.box.first).to eq [0,1,5,0,0,0,2,7,0]
  end

  it "should know what is in the last box " do
    expect(grid.box.last).to eq [0, 4, 0, 0, 2, 5, 6, 0, 0]
  end
end
end



