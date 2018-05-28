require "sinatra"
require 'json'
require_relative './model/fleet'
require_relative './controller/cabs_controller'
require_relative './views/cabs_view'

# Initialize fleet
fleet = Fleet.new
cabs_controller = CabsController.new(fleet)

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

# Books cab
# @params: cab_type, pickup_lat, pickup_long, drop_lat, drop_long
# @response: string | json
post '/api/cabs/book/:cab_type/new.json' do
  content_type :json

  cab_type    = params[:cab_type]
  pickup_lat  = params[:pickup_lat].to_f
  pickup_long = params[:pickup_long].to_f
  drop_lat    = params[:drop_lat].to_f
  drop_long   = params[:drop_long].to_f

  render = cabs_controller.new(cab_type, pickup_lat, pickup_long, drop_lat, drop_long)

  render.to_json
end

post '/api/cabs/book/:cab_type/:id/release.json' do
  content_type :json

  cab_type   = params[:cab_type]
  cab_number = params[:id].to_i

  render = cabs_controller.delete(cab_type, cab_number)
  render.to_json
end
