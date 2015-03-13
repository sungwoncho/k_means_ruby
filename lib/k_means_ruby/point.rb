module KMeansRuby
  class Point

    attr_accessor :x, :y

    def initialize(x = 0, y = 0)
      @x = x
      @y = y
    end

    def to_s
      "(#{x},#{y})"
    end

    def +(point)
      Point.new(@x+point.x, @y+point.y)
    end

    def /(num)
      Point.new(@x/num, @y/num)
    end
  end
end
