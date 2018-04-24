require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane1) { Plane.new(777) }
  let(:plane2) { Plane.new(747) }

  describe '#land' do
    context 'when the weather is stormy' do
      it 'prevents a plane to land at an airport' do
        expect { subject.land(plane1, :stormy) }.to raise_error("The weather is too stormy to land!")
      end
    end

    context 'when the weather is sunny' do
      it 'instructs a plane to land at an airport' do
        expect(subject.land(plane1, :sunny)).to eq([plane1])
      end
    end

    context 'when the airport is full' do
      it 'should prevent a plane to land at the airport' do
        airport.hangar = (1..10).map{ |i| Plane.new(i) }
        expect { subject.land(plane1, :sunny) }.to raise_error('Sorry, the airport is full already!')
      end
    end

    context 'when the plane is landed' do
      it 'should raise an error' do
        airport.hangar = [plane1]
        expect { subject.land(plane1, :sunny) }.to raise_error('Sorry, the plane is landed already!')
      end
    end
  end

  describe '#take_off' do
    context 'when there is only one plane in the airport' do
      it 'should prevent a plane to take off from an airport' do
        airport.hangar = [plane2]
        expect { subject.take_off(plane2, :stormy) }.to raise_error('The weather is too stormy to take off!')
      end

      it 'the airport is empty after the plane takes off' do
        airport.hangar = [plane2]
        expect(subject.take_off(plane2, :sunny)).to eq([])
      end
    end

    context 'when there are more than one planes in the airport' do
      it 'should prevent one of the planes to take off' do
        airport.hangar = [plane1, plane2]
        expect { subject.take_off(plane1, :stormy) }.to raise_error("The weather is too stormy to take off!")
      end

      it 'instructs one of the planes to take off' do
        airport.hangar = [plane1, plane2]
        expect(subject.take_off(plane1, :sunny)).to eq([plane2])
      end
    end

    context 'when the plane is flying' do
      it 'raise an error' do
        airport.hangar = [plane1]
        expect { subject.take_off(plane2, :sunny) }.to raise_error('Sorry, the plane is flying already!')
      end
    end
  end

end
