#¡usr/bin/ruby env

class Cell

    attr_accessor :value

    def initialize(value, grid)
      @value = value
      @grid = grid
    end

    def incomplete?
      value == 0
    end




    
    # def solve

    # end

end


