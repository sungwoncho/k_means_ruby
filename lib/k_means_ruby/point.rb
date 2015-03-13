module KMeansRuby
  class Point

    attr_accessor :x, :y, :current_cluster

    def initialize(x = 0, y = 0)
      @x = x.to_f
      @y = y.to_f
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

    def merge_to_cluster(c)
      self.current_cluster = c
      c.points << self
      c.update_centroid
    end
  end
end
