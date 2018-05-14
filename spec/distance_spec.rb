require 'rspec'
require 'random-location'
require_relative '../helper/distance'

describe "Distance helper" do
  let(:distance)        { Distance.new }
  let(:pickup_location) { RandomLocation.near_by(12.978291,  77.638594, 1000) }
  let(:drop_location)   { RandomLocation.near_by(12.9972469, 77.638594, 1000) }

  context "distance" do
    it 'should create a new distance object' do
      expect(distance).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(Distance).to respond_to(:calculate)
    end
  end

  context "distance calculation" do
    subject { Distance.calculate(pickup_location, drop_location) }

    it 'should return distance in float' do
      expect(subject).to be_an_instance_of(Float)
    end
  end
end
