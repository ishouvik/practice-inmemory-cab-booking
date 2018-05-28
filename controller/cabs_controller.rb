require 'json'
require_relative '../model/user'
require_relative '../helper/booking'

class CabsController
  attr_accessor :fleet,
                :cab_type,
                :pickup_lat,
                :pickup_long,
                :drop_lat,
                :drop_long

  def initialize(fleet)
    @fleet = fleet
  end

  def index(available_pink_cabs, available_go_cabs)
    return { :pink_cabs => available_pink_cabs, :available_go_cabs => available_go_cabs }
  end

  def new(cab_type, pickup_lat, pickup_long, drop_lat, drop_long)
    user    = User.new(pickup_lat, pickup_long, drop_lat, drop_long)
    booking = Booking.new(@fleet, cab_type)

    return booking.new(user)
  end

  def delete(cab_type, cab_number)
    booking = Booking.new(@fleet, cab_type)
    return booking.delete(cab_number)
  end
end
