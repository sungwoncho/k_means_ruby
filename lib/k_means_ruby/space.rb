module KMeansRuby
  class Space
    class << self
      def get_distance(p1, p2)
        Math.sqrt( (p1.x - p2.x)**2 + (p1.y - p2.y)**2 )
      end
    end
  end
end
