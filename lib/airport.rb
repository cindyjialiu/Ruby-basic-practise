require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane, weather)
    raise 'The weather is too stormy to land!' if weather == :stormy
    raise 'Sorry, the airport is full already!' if @hangar.length == capacity
    raise 'Sorry, the plane is landed already!' unless flying?(plane)
    @hangar << plane
  end

  def take_off(plane, weather)
    raise 'The weather is too stormy to take off!' if weather == :stormy
    raise 'Sorry, the plane is flying already!' if flying?(plane)
    @hangar.delete(plane)
    @hangar
  end

  private
  def flying?(plane)
    !@hangar.include?(plane)
  end

end
