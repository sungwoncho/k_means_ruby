require "spec_helper"

describe KMeansRuby::Algorithm do

  let(:p1) { KMeansRuby::Point.new(1,5) }
  let(:p2) { KMeansRuby::Point.new(8,4) }
  let(:p3) { KMeansRuby::Point.new(10,16) }
  let(:p4) { KMeansRuby::Point.new(10,17) }

  let(:c1) { KMeansRuby::Cluster.new(p1) }
  let(:c2) { KMeansRuby::Cluster.new(p4) }

  describe 'attributes' do
    it { should respond_to(:points) }
    it { should respond_to(:clusters) }
  end

  describe '#run_once' do

    before(:each) do
      algorithm = KMeansRuby::Algorithm.new(points=[p1,p2,p3,p4], clusters=[c1,c2])

      algorithm.run_once
    end

    it 'merges p2 to c1' do
      expect(p2.current_cluster).to eq c1
    end

    it 'merges p3 to c2' do
      expect(p3.current_cluster).to eq c2
    end
  end

  describe '#repeat_for' do
    context 'with n=3' do
      it 'runs the algorithm 3 times' do
        algorithm = KMeansRuby::Algorithm.new(points=[p1,p2,p3,p4], clusters=[c1,c2])
        expect(algorithm).to receive(:run_once).exactly(3).times

        algorithm.repeat_for(3)
      end
    end
  end
end
