require_relative './distance'
require_relative './payment'

class Booking
  attr_accessor :user, :fleet, :cab_type

  # @params fleet:object, cab_type:string
  def initialize(fleet, cab_type)
    @fleet    = fleet
    @cab_type = cab_type
  end

  # Open a new booking and calculate distance, payable_amount
  # @params user:object
  # @return json object
  def new(user)
    travel_distance = Distance.calculate(user.pickup_location, user.drop_location)
    payable_amount  = Payment.amount(travel_distance, @cab_type)
    assigned_cab    = @fleet.assign_cab(@cab_type, user)
    cab_number      = assigned_cab[:id]

    return {
      cab_type:         cab_type,
      cab_number:       cab_number,
      travel_distance:  travel_distance,
      payable_amount:   payable_amount
    }
  end

  # Delete a booking/end journey and release cab
  # @params cab_number:integer
  # @return json
  def delete(cab_number)
    @fleet.release_cab(cab_number, @cab_type)
    return { message: "Ok", cab_number: cab_number }
  end
end
