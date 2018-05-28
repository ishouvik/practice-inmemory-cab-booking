require 'pp'
require_relative './cab.rb'
require_relative '../helper/distance'

class Fleet
  attr_accessor :size, :go_cabs, :pink_cabs

  # @params size:integer
  def initialize(size = 100)
    @size = size
    @go_cabs = []
    @pink_cabs = []

    0.upto (size) do |index|
      @go_cabs   << Cab.new(index)
      @pink_cabs << Cab.new(index)
    end
  end

  # Get an array of all available go cabs
  # @return array
  def available_go_cabs
    arr = []
    @go_cabs.select { |cab| arr << cab if (cab.available == true) }
    return arr
  end

  # Get an array of all busy go cabs
  # @return array
  def busy_go_cabs
    arr = []
    @go_cabs.select { |cab| arr << cab if (cab.available == false) }
    return arr
  end

  # Get an array of all available pink cabs
  # @return array
  def available_pink_cabs
    arr = []
    @pink_cabs.select { |pink_cab| arr << pink_cab if (pink_cab.available == true) }
    return arr
  end

  # Get an array of all busy pink cabs
  # @return array
  def busy_pink_cabs
    arr = []
    @pink_cabs.select { |pink_cab| arr << pink_cab if (pink_cab.available == false) }
    return arr
  end

  # Assign a go/pink cab from the available cabs
  # @params cab_type:string | pink/go
  # @params rider_location:array | [12.980748951664836, 77.64609817264311]
  # @return hash
  def assign_cab(cab_type, user)
    # Determine which fleet to choose
    (cab_type == 'pink') ? (cabs = self.available_pink_cabs) : (cabs = self.available_go_cabs)

    cabs_with_distance = []

    cabs.each do |cab|
      cab_hash = {
        id: cab.number,
        distance: Distance.calculate(cab.location, user.pickup_location)
      }
      cabs_with_distance << cab_hash
    end

    sorted_cabs    = cabs_with_distance.sort! { |a, b|  a['distance'] <=> b['distance'] }
    nearest_cab    = sorted_cabs.last
    nearest_cab_id = nearest_cab['id'].to_i

    # Remove cab from the available stack
    cabs[nearest_cab_id].available = false
    cabs[nearest_cab_id].user      = user

    return nearest_cab.to_h
  end

  # Release a cab, make it available again
  # @params number:integer, cab_type:string
  def release_cab(number, cab_type)
    (cab_type == 'pink') ? (cabs = @pink_cabs) : (cabs = @go_cabs)

    cabs[number].available = true
    cabs[number].location = cabs[number].user.drop_location
  end
end
