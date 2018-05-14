require_relative '../app/fleet'

class HtmlCabsController
  # attr_accessor :fleet,
  #               :available_pink_cabs,
  #               :available_go_cabs

  def initialize
    @fleet               = Fleet.new
    @available_pink_cabs = @fleet.available_pink_cabs
    @available_go_cabs   = @fleet.available_go_cabs
  end

  def index
    html = "<p>Available Pink Cabs: #{@available_pink_cabs.size} | Available Go Cabs: #{@available_go_cabs.size} </p>"
    return html
  end
end
