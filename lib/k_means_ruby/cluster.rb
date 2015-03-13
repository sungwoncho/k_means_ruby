module KMeansRuby
  class Cluster
    attr_accessor :centroid, :points

    def initialize(*points)
      @points = points

      update_centroid
    end

    def to_s
      "Cluster with centroid (#{centroid.x},#{centroid.y})"
    end

    def update_centroid
      self.centroid = points.reduce(&:+)/points.length
    end
  end
end
