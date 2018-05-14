# Load classes
require_relative './app/fleet'
require_relative './app/user'
require_relative './helper/distance'
require_relative './helper/payment'

# Initialize objects
user  = User.new
fleet = Fleet.new

travel_distance = Distance.calculate(user.pickup_location, user.drop_location)

# Start user input
puts "PLEASE SELECT CAB TYPE"
puts "[1] PINK"
puts "[2] GO"
cab_type = gets.to_i
(cab_type == 1) ? (cab_type = 'pink') : (cab_type = 'go')

# Assicn cab
payable_amount = Payment.amount(travel_distance, cab_type)
assigned_cab = fleet.assign_cab(cab_type, user.pickup_location)
cab_number   = assigned_cab[:id]

puts "Cab No. #{cab_number} is arriving at your location"
sleep 5

puts "Cab No. #{cab_number} has arrived at your location"
sleep 5

puts "Cab type: #{cab_type.upcase}"
puts "You have reached your destination."
puts "Distance: #{travel_distance}"
puts "Payable amount: #{payable_amount} DragonCoin"

# Push the cab back to the available stack
fleet.release_cab(cab_number, cab_type)
