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

  def available_go_cabs
    arr = []
    @go_cabs.select { |cab| arr << cab if (cab.available == true) }
    return arr
  end

  def busy_go_cabs
    arr = []
    @go_cabs.select { |cab| arr << cab if (cab.available == false) }
    return arr
  end

  def available_pink_cabs
    arr = []
    @pink_cabs.select { |pink_cab| arr << pink_cab if (pink_cab.available == true) }
    return arr
  end

  def busy_pink_cabs
    arr = []
    @pink_cabs.select { |pink_cab| arr << pink_cab if (pink_cab.available == false) }
    return arr
  end
end
