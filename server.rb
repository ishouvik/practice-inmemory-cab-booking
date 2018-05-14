require "sinatra"
require 'json'
require_relative './api/v1/cabs'
require_relative 'html/cabs'

get '/' do
  controller = HtmlCabsController.new
  controller.index
end


get '/api/cabs.json' do
  content_type :json
  ApiCabsController.index
end
