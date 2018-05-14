require 'json'
require_relative '../../app/fleet'
require_relative '../../app/user'
require_relative '../../helper/distance'
require_relative '../../helper/payment'

class ApiCabsController
  def initialize
    @user                = User.new
    @fleet               = Fleet.new
    @available_pink_cabs = @fleet.available_pink_cabs
    @available_go_cabs   = @fleet.available_go_cabs
    @travel_distance     = Distance.calculate(@user.pickup_location, @user.drop_location)
  end

  def index
    return { :pink_cabs => @available_pink_cabs.size, :available_go_cabs => @available_go_cabs.size }
  end

  def book_pink
    return process_boking('pink')
  end

  def book_go
    return process_boking('go')
  end

  def process_boking(cab_type)
    payable_amount = Payment.amount(@travel_distance, cab_type)
    assigned_cab = @fleet.assign_cab(cab_type, @user.pickup_location)
    cab_number   = assigned_cab[:id]

    return {
      cab_type: cab_type,
      cab_number: cab_number,
      travel_distance: @travel_distance,
      payable_amount: payable_amount
    }
  end
end
