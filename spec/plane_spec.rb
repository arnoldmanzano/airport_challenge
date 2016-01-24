require 'plane'

describe Plane do

  describe '#land' do
    it 'has landed' do
      subject.land
      expect(subject.landed).to eq true
    end

    it 'raises error if plane already landed' do
      subject.land
      message = 'Cannot land again, plane already landed!'
      expect { subject.land }.to raise_error(message)
    end
  end

  describe '#take_off' do
    it 'is no longer in land' do
      subject.take_off
      expect(subject.landed).to eq false
    end

    it 'raises error if plane already took off' do
      subject.take_off
      message = 'Cannot take off again, plane already took off!'
      expect { subject.take_off }.to raise_error(message)
    end
  end
end
