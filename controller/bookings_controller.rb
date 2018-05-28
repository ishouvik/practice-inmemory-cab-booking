require 'json'
require_relative '../model/user'
require_relative '../helper/booking'

class BookingsController
  attr_accessor :fleet,
                :cab_type,
                :pickup_lat,
                :pickup_long,
                :drop_lat,
                :drop_long

  def initialize(fleet)
    @fleet = fleet
  end

  # Opens a new cab booking and starts journey
  # @params cab_type:string pickup_lat:float, pickup_long:float, drop_lat:float, drop_long:float
  # @return jsob object
  def new(cab_type, pickup_lat, pickup_long, drop_lat, drop_long)
    user    = User.new(pickup_lat, pickup_long, drop_lat, drop_long)
    booking = Booking.new(@fleet, cab_type)

    return booking.new(user)
  end

  # Delets a booking and releases cab
  # @params cab_type:string, cab_number:integer
  # @return json object
  def delete(cab_type, cab_number)
    booking = Booking.new(@fleet, @cab_type)

    return booking.delete(cab_number)
  end
end
