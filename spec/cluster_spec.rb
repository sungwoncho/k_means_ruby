require "spec_helper"

describe KMeansRuby::Cluster do

  let(:p1) { KMeansRuby::Point.new(1,2) }
  let(:p2) { KMeansRuby::Point.new(4,7) }
  let(:p3) { KMeansRuby::Point.new(10,12) }

  describe 'initialize' do
    it 'updates the centroid' do
      cluster = KMeansRuby::Cluster.new(p1,p2)
      expect(cluster.centroid.x).to eq 2.5
      expect(cluster.centroid.y).to eq 4.5
    end
  end

  describe '#to_s' do
    it "prints 'Cluster with centroid (x,y)'" do
      cluster = KMeansRuby::Cluster.new(p1)
      expect(cluster.to_s).to eq 'Cluster with centroid (1.0,2.0)'
    end
  end

  describe '#update_centroid' do
    it 'calculates the average of the points and use it as the centroid' do
      cluster = KMeansRuby::Cluster.new(p1)
      allow(cluster).to receive(:points).and_return([p1,p2,p3]) # Simulate a cluster with three points.

      cluster.update_centroid

      expect(cluster.centroid.x).to eq 5.0
      expect(cluster.centroid.y).to eq 7.0
    end

    it 'returns the new centroid' do
      cluster = KMeansRuby::Cluster.new(p1)
      allow(cluster).to receive(:points).and_return([p1,p2,p3]) # Simulate a cluster with three points.

      result = cluster.update_centroid

      expect(result).to be_a(KMeansRuby::Point)
      expect(result.x).to eq 5.0
      expect(result.y).to eq 7.0
    end
  end
end
