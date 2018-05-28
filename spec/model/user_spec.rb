require 'rspec'
require 'random-location'
require_relative '../../model/user'

pickup_location = RandomLocation.near_by(12.9972469, 77.638594, 1000)
drop_location   = RandomLocation.near_by(12.9972469, 77.638594, 1200)

describe "User management" do
  let(:user) { User.new( pickup_location[0], pickup_location[1], drop_location[0], drop_location[1] ) }

  context "User" do
    it 'should create a new cab object' do
      expect(user).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(user).to respond_to(:pickup_location)
      expect(user).to respond_to(:drop_location)
      expect(user).to respond_to(:pickup_lat)
      expect(user).to respond_to(:pickup_long)
      expect(user).to respond_to(:drop_lat)
      expect(user).to respond_to(:drop_long)
    end

    it 'should respond to proper data types' do
      expect(user.pickup_lat).to      be_an_instance_of(Float)
      expect(user.pickup_long).to     be_an_instance_of(Float)
      expect(user.drop_lat).to        be_an_instance_of(Float)
      expect(user.drop_long).to       be_an_instance_of(Float)
      expect(user.pickup_location).to be_an_instance_of(Array)
      expect(user.drop_location).to   be_an_instance_of(Array)
    end
  end
end
