# k_means_ruby

An implementation of k-means algorithm in Ruby.

## Definition

K-means algorithm is a clustering algorithm for a Euclidean space. It assumes that there are k clusters in the beginning.

* Choose k points that are likely to be in different clusters.
* Make those the points centroids of clusters.
* For the remaining points:
- Find the centroid to which the point is closest.
- Merge the point into that cluster.
- Recalculate the centroid of that cluster.

## Use

In your ruby console, require the main file.

`require './lib/k_means_ruby.rb'`

Define `Points` and `Clusters`.

```
p1 = KMeansRuby::Point.new(1,2)
p2 = KMeansRuby::Point.new(10,19)
...
c1 = KMeansRuby::Cluster.new(p1)
...
```

Instantiate the `Algorithm`

algorithm = `KMeansRuby::Algorithm.new(points=[p1, p2], clusters=[c1])`

Run the algorithm by calling `algorithm.run_once` or `algorithm.repeat_for(n)`

## Contributing

### TODO:

* Allow users to run the algorithm until the clusters do not change anymore.
