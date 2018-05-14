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

if cab_type == 1
  cabs           = fleet.pink_cabs
  available_cabs = fleet.available_pink_cabs
  payable_amount = Payment.amount(travel_distance, 'pink')
else
  cabs           = fleet.go_cabs
  available_cabs = fleet.available_go_cabs
  payable_amount = Payment.amount(travel_distance, 'go')
end

puts "PLEASE SELECT YOUR CAB"
puts available_cabs.map { |cab| cab.number }.join(', ')
cab_number = gets.to_i
cabs[cab_number].available = false

puts "Cab No. is arriving at your location"
sleep 5

puts "Cab No. has arrived at your location"
sleep 5

puts "Cab type: #{cab_type}"
puts "Your cab reached your destination."
puts "Distance: #{travel_distance}"
puts "Payable amount: #{payable_amount} DragonCoin"
cabs[cab_number].available = true
