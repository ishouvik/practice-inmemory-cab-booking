require 'json'

class CabsController
  # Display available pink and go cabs count
  # @params available_pink_cabs:integer, available_go_cabs:integer
  # @return json
  def index(available_pink_cabs, available_go_cabs)
    return { :pink_cabs => available_pink_cabs, :go_cabs => available_go_cabs }
  end
end
