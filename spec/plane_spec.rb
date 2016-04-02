require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land' do
    it 'has landed' do
      plane.land
      expect(plane.landed).to eq true
    end

    it 'raises error if plane already landed' do
      plane.land
      message = 'Plane in land, cannot land again!'
      expect { plane.land }.to raise_error(message)
    end
  end

  describe '#take_off' do
    before(:each) do
      plane.land
    end

    it 'is no longer in land' do
      plane.take_off
      expect(plane.landed).to eq false
    end

    it 'raises error if plane already took off' do
      plane.take_off
      message = 'Plane in flight, cannot take off again!'
      expect { plane.take_off }.to raise_error(message)
    end
  end
end
