require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane1) { Plane.new(747) }
  let(:plane2) { Plane.new(777) }

  describe '#land' do
    it 'instructs a plane to land at an airport' do
      expect(subject.land(plane1)).to eq([plane1])
    end
  end

  describe '#take_off' do
    context 'when there is only one plane in the airport' do
      it 'instructs a plane to take off from an airport' do
        subject.land(plane2)
        expect(subject.take_off(plane2)).to eq([])
      end
    end
    
    context 'when there are more than one planes in the airport' do
      it 'instructs one of the planes to take off' do
        subject.land(plane1)
        subject.land(plane2)
        expect(subject.take_off(plane1)).to eq([plane2])
      end
    end
  end


end
