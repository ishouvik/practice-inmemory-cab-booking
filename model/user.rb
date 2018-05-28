require 'random-location'

class User
  attr_accessor :pickup_location,
                :drop_location,
                :pickup_lat,
                :pickup_long,
                :drop_lat,
                :drop_long

  # @params pickup_lat:float, pickup_long:float, drop_lat:float, drop_long:float
  def initialize(pickup_lat, pickup_long, drop_lat, drop_long)
    @pickup_lat  = pickup_lat
    @pickup_long = pickup_long
    @drop_lat    = drop_lat
    @drop_long   = drop_long

    @pickup_location = [pickup_lat, pickup_long]
    @drop_location   = [drop_lat, drop_long]
  end
end
