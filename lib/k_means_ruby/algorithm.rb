module KMeansRuby
  class Algorithm
    attr_accessor :points, :clusters

    def initialize(points=[], clusters=[])
      @points = points
      @clusters = clusters
    end

    def run_once
      @points.each do |point|
        distances = @clusters.map do |cluster|
          Space.get_distance(cluster.centroid, point)
        end

        closest_cluster_index = distances.index(distances.min)
        closest_cluster = @clusters[closest_cluster_index]

        if point.current_cluster != closest_cluster
          puts "#{point} merged to #{closest_cluster}"
          point.merge_to_cluster(closest_cluster)
        end
      end
    end

    def repeat_for(n)
      n.times { run_once }
    end
  end
end
