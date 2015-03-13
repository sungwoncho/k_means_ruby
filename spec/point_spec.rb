require "spec_helper"

describe KMeansRuby::Point do
  describe 'attributes' do
    it { should respond_to(:x) }
    it { should respond_to(:y) }
  end

  describe '#to_s' do
    it 'prints (x,y)' do
      point = KMeansRuby::Point.new(1,2)
      expect(point.to_s).to eq '(1,2)'
    end
  end

  describe '#+' do
    it 'is defined' do
      point = KMeansRuby::Point.new(1,2)
      expect(point).to respond_to(:+)
    end

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

      sum = p1 + p2

      expect(sum).to be_a(KMeansRuby::Point)
    end
  end

  describe '#/' do
    it 'is defined' do
      point = KMeansRuby::Point.new(1,2)
      expect(point).to respond_to(:/)
    end

    it 'divides x and y by the number' do
      point = KMeansRuby::Point.new(10,4)
      result = point/2

      expect(result.x).to eq 5
      expect(result.y).to eq 2
    end
  end
end
