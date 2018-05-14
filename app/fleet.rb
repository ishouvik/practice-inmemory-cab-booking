require_relative './cab.rb'

class Fleet
  attr_accessor :size, :go_cabs, :pink_cabs

  def initialize(size = 100)
    @size = size
    @go_cabs = []
    @pink_cabs = []

    0.upto (size) do |index|
      @go_cabs << Cab.new(index)
      @pink_cabs << Cab.new(index)
    end
  end
end
