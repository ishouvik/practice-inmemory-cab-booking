require 'random-location'
class Cab
  attr_accessor :available, :number, :location, :user

  def initialize(number, location = false, user = nil)
    @available = true
    @number = number
    @user = user
    @location = location || RandomLocation.near_by(12.9972469, 77.638594, 1000)
  end
end
