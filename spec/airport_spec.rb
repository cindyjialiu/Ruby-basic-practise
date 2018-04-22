require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane1) { double("plane1")}
  let(:plane2) { double("plane2")}

  describe '#land' do
    context 'when the weather is stormy' do
      it 'prevents a plane to land at an airport' do
        allow(airport.weather).to receive(:is_stormy?) { true }
        expect{ subject.land(plane1) }.to raise_error("The weather is too stormy to land!")
      end
    end

    context 'when the weather is sunny' do
      it 'instructs a plane to land at an airport' do
        allow(airport.weather).to receive(:is_stormy?) { false }
        expect( subject.land(plane1) ).to eq([plane1])
      end
    end
  end

  describe '#take_off' do
    context 'when the weather is stormy' do
      it 'should prevent a plane to take off from an airport' do
        airport.hangar = [ plane2 ]
        allow(airport.weather).to receive(:is_stormy?) { true }
        expect{ subject.take_off(plane2) }.to raise_error("The weather is too stormy to take off!")
      end

      it 'should to take off from an airport' do
        airport.hangar = [ plane2 ]
        allow(airport.weather).to receive(:is_stormy?) { false }
        expect( subject.take_off(plane2) ).to eq([])
      end
    end

    context 'when the weather is stormy' do
      it 'should prevent one of the planes to take off' do
        airport.hangar = [ plane1, plane2 ]
        allow(airport.weather).to receive(:is_stormy?) { true }
        expect{ subject.take_off(plane1) }.to raise_error("The weather is too stormy to take off!")
      end

      it 'instructs one of the planes to take off' do
        airport.hangar = [ plane1, plane2 ]
        allow(airport.weather).to receive(:is_stormy?) { false }
        expect(subject.take_off(plane1)).to eq([plane2])
      end
    end
  end

end
