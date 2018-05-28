require 'rspec'
require_relative '../../model/fleet'
require_relative '../../model/user'
require_relative '../../helper/booking'

user_pickup_location = [12.979644698160321, 77.64538439713968]
user_drop_location   = [12.970551164386844, 77.63746822801073]
fleet_size           = 100
cab_type_go          = 'go'
cab_type_pink        = 'pink'

describe 'Booking helper' do
  let(:user) { User.new( user_pickup_location[0], user_pickup_location[1], user_drop_location[0], user_drop_location[1] ) }
  let(:fleet) { Fleet.new(fleet_size) }
  subject { Booking.new(fleet, cab_type_go) }

  let(:new_booking) { subject.new(user) }

  context "Go Booking" do
    it 'should create a new go booking object' do
      expect(subject).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(subject).to respond_to(:user)
      expect(subject).to respond_to(:fleet)
      expect(subject).to respond_to(:cab_type)

      expect(new_booking[:cab_type]).to be_an_instance_of(String)
      expect(new_booking[:cab_number]).to be_an_instance_of(Integer)
      expect(new_booking[:travel_distance]).to be_an_instance_of(Float)
      expect(new_booking[:payable_amount]).to be_an_instance_of(Float)
    end

    it 'should calculate booking details properly' do
      expect(new_booking[:cab_type]).to be cab_type_go
      expect(new_booking[:travel_distance]).to be 64.66691770299529
      expect(new_booking[:payable_amount]).to be 129.33383540599058
    end
  end
end
