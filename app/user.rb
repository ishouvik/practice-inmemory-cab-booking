require 'random-location'

class User
  attr_accessor :pickup_location, :drop_location

  def initialize
    @pickup_location = RandomLocation.near_by(12.978291, 77.638594, 1000)
    @drop_location   = RandomLocation.near_by(12.9972469, 77.638594, 1000)
  end
end
