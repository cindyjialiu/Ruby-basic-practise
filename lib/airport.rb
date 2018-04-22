require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :weather
attr_accessor :hangar

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise "The weather is too stormy to land!" if weather.is_stormy? == true
    @hangar << plane
  end

  def take_off(plane)
    raise "The weather is too stormy to take off!" if weather.is_stormy? == true
    @hangar.delete(plane)
    @hangar
  end

end
