require "sinatra"
require 'json'
require_relative './model/fleet'
require_relative './controller/cabs_controller'
require_relative './controller/bookings_controller'
require_relative './views/cabs_view'

# Initialize objects
fleet = Fleet.new
cabs_controller     = CabsController.new
bookings_controller = BookingsController.new(fleet)

# Renders number of cabs
# @response: string | html
get '/' do
  controller = CabsView.new
  controller.index(fleet.available_pink_cabs.size, fleet.available_go_cabs.size)
end

# Renders number of cabs
# @response: string | json
get '/api/cabs.json' do
  content_type :json
  render = cabs_controller.index(fleet.available_pink_cabs.size, fleet.available_go_cabs.size)
  render.to_json
end

# Books cab and starts journey
# @params: cab_type:string, pickup_lat:float, pickup_long:float, drop_lat:float, drop_long:float
# @response: string | json
post '/api/bookings/:cab_type/new.json' do
  content_type :json

  cab_type    = params[:cab_type]
  pickup_lat  = params[:pickup_lat].to_f
  pickup_long = params[:pickup_long].to_f
  drop_lat    = params[:drop_lat].to_f
  drop_long   = params[:drop_long].to_f

  render = bookings_controller.new(cab_type, pickup_lat, pickup_long, drop_lat, drop_long)
  render.to_json
end

# Ends journey and releases cab
# @params cab_type, id:integer
# @response: string | json
post '/api/bookings/:cab_type/:id/delete.json' do
  content_type :json

  cab_type   = params[:cab_type]
  cab_number = params[:id].to_i

  render = bookings_controller.delete(cab_type, cab_number)
  render.to_json
end
