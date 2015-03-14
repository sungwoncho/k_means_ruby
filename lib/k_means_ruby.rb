$LOAD_PATH.unshift(File.expand_path('../k_means_ruby',__FILE__))

module KMeansRuby
  autoload :Cluster, 'cluster'
  autoload :Point, 'point'
  autoload :Space, 'space'
  autoload :Algorithm, 'algorithm'
end
