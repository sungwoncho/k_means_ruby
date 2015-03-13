require "spec_helper"

describe KMeansRuby::Point do

  let(:p1) { KMeansRuby::Point.new(1,2) }
  let(:p2) { KMeansRuby::Point.new(3,4) }

  describe 'attributes' do
    it { should respond_to(:x) }
    it { should respond_to(:y) }
    it { should respond_to(:current_cluster) }
  end

  describe '#to_s' do
    it 'prints (x,y)' do
      point = KMeansRuby::Point.new(1,2)
      expect(point.to_s).to eq '(1.0,2.0)'
    end
  end

  describe '#+' do
    it 'adds x and y coordinates' do
      p1 = KMeansRuby::Point.new(1,2)
      p2 = KMeansRuby::Point.new(10,5)

      sum = p1 + p2

      expect(sum.x).to eq 11
      expect(sum.y).to eq 7
    end

    it 'returns a new Point object' do
      p1 = KMeansRuby::Point.new(1,2)
      p2 = KMeansRuby::Point.new(10,5)

      result = p1 + p2

      expect(result).to be_a(KMeansRuby::Point)
    end
  end

  describe '#/' do
    it 'divides x and y by the number' do
      point = KMeansRuby::Point.new(10,4)
      result = point/2

      expect(result.x).to eq 5
      expect(result.y).to eq 2
    end

    it 'returns a new Point object' do
      point = KMeansRuby::Point.new(10,4)
      result = point/2

      expect(result).to be_a(KMeansRuby::Point)
    end
  end

  describe '#merge_to_cluster' do
    it 'updates the current_cluster of the point' do
      cluster = KMeansRuby::Cluster.new(p2)

      p1.merge_to_cluster(cluster)
      expect(p1.current_cluster).to eq cluster
    end

    it 'inserts the self into the points of the cluster' do
      cluster = KMeansRuby::Cluster.new(p2)

      p1.merge_to_cluster(cluster)
      expect(cluster.points).to include p1
    end

    it 'updates the centroid of the cluster' do
      cluster = KMeansRuby::Cluster.new(p2)

      p1.merge_to_cluster(cluster)
      expect(cluster.centroid.x).to eq 2
      expect(cluster.centroid.y).to eq 3
    end
  end
end
