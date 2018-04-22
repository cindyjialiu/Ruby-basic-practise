require 'airport'

describe 'Airport' do

  describe '#land' do
    airport = Airport.new
    plane = Plane.new
    it 'instructs a plane to land at an airport' do
      expect(airport.land(plane)).to eq([plane])
    end
  end

end
