require "spec_helper"

describe KMeansRuby::Space do

  let(:p1) { KMeansRuby::Point.new(1,2) }
  let(:p2) { KMeansRuby::Point.new(5,5) }

  describe '.get_distance' do
    it 'returns the distance of two points' do
      distance = KMeansRuby::Space.get_distance(p1, p2)

      expect(distance).to eq 5
    end
  end
end
