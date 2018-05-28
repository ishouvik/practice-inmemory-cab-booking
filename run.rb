require_relative './model/fleet'
require_relative './controller/cabs_controller'

# Initialize fleet
fleet = Fleet.new
cabs_controller = CabsController.new(fleet)

puts "ENTER YOUR CAB TYPE -> PINK | GO"
cab_type = gets.downcase

puts "ENTER YOUR PICKUP LOCATION"
puts "LAT"
pickup_lat = gets.to_f
puts "LONG"
pickup_long = gets.to_f

puts "ENTER YOUR DESTINATION"
puts "LAT"
drop_lat = gets.to_f
puts "LONG"
drop_long = gets.to_f

booked_cab = cabs_controller.new(cab_type, pickup_lat, pickup_long, drop_lat, drop_long)
cab_type   = booked_cab[:cab_type]
cab_number = booked_cab[:cab_number]

puts "YOUR CAB IS ON ITS WAY"
puts "YOUR #{cab_type.upcase} CAB IS WAITING FOR YOU"
puts "PRESS ENTER TO END JOURNEY"
gets
puts booked_cab
puts cabs_controller.delete(cab_type, cab_number)

