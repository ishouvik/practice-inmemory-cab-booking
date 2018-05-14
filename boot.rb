# Main module

# Load classes
require_relative './app/fleet'

# Initialize objects
fleet = Fleet.new

puts "PLEASE SELECT CAB TYPE"
puts "[1] PINK"
puts "[2] GO"
cab_type = gets.to_i

if cab_type == 1
  cabs           = fleet.pink_cabs
  available_cabs = fleet.available_pink_cabs
else
  cabs           = fleet.go_cabs
  available_cabs = fleet.available_go_cabs
end

puts "PLEASE SELECT YOUR CAB"


puts "Cab No. is arriving at your location"
sleep 5

puts "Cab No. has arrived at your location"
sleep 5

puts "Cab type: #{cab_type}"
puts "Your cab reached your destination."
puts "Distance: XXX"
puts "Payable amount: XXX"
