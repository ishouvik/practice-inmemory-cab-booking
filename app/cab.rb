require 'random-location'
class Cab
  attr_accessor :available, :number, :location

  def initialize(number)
    @available = true
    @number = number
    @location = RandomLocation.near_by(12.9972469, 77.638594, 1000)
  end
end
