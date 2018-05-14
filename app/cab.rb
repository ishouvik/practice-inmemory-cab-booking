class Cab
  attr_accessor :available, :number

  def initialize(number)
    @available = true
    @number = number
  end
end
