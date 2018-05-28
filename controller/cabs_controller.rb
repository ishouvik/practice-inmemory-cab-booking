require 'json'

class CabsController
  def index(available_pink_cabs, available_go_cabs)
    return { :pink_cabs => available_pink_cabs, :go_cabs => available_go_cabs }
  end
end
