require_relative 'plane'

class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    @hangar.delete(plane)
    @hangar
  end

end
