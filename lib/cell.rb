#¡usr/bin/ruby env

class Cell

    attr_accessor :value

    def initialize(value)
      @value = value
    end

    def solved?
      value != 0
    end

end


