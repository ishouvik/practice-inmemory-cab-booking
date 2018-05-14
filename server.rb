require "sinatra"
require 'json'
require_relative './api/v1/cabs'
require_relative 'html/cabs'

# Renders number of cabs
# @response: string | html
get '/' do
  controller = HtmlCabsController.new
  controller.index
end

# Renders number of cabs
# @response: string | json
get '/api/cabs.json' do
  content_type :json
  controller = ApiCabsController.new
  render = controller.index
  render.to_json
end

# Books pink cab
# @response: string | json
post '/api/cabs/book/pink.json' do
  content_type :json
  controller = ApiCabsController.new
  render = controller.book_pink
  render.to_json
end

# Books go cab
# @response: string | json
post '/api/cabs/book/go.json' do
  content_type :json
  controller = ApiCabsController.new
  render = controller.book_go
  render.to_json
end
