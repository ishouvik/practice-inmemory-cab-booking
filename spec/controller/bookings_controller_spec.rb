require 'rspec'
require_relative "../../model/fleet"
require_relative '../../controller/bookings_controller'

describe "Booking Controller" do
  let(:cab_type)    { 'go' }
  let(:pickup_lat)  { 12.979644698160321 }
  let(:pickup_long) { 77.64538439713968 }
  let(:drop_lat)    { 12.970551164386844 }
  let(:drop_long)   { 77.63746822801073 }
  let(:fleet)       { Fleet.new }

  subject { BookingsController.new(fleet) }
  let(:index)  { subject.index(fleet.available_pink_cabs.size, fleet.available_go_cabs.size) }
  let(:new)    { subject.new(cab_type, pickup_lat, pickup_long, drop_lat, drop_long) }
  let(:delete) { subject.delete(new.to_h[:cab_type], new.to_h[:cab_number]) }

  context "Cabs" do
    it 'should create a new booking object' do
      expect(subject).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(subject).to respond_to(:fleet)
      expect(subject).to respond_to(:cab_type)
      expect(subject).to respond_to(:pickup_lat)
      expect(subject).to respond_to(:pickup_long)
      expect(subject).to respond_to(:drop_lat)
      expect(subject).to respond_to(:drop_long)
    end
  end

  context "index" do
    it 'should list available cabs' do
      expect(index).to             be_an_instance_of(Hash)
      expect(index[:pink_cabs]).to be_an_instance_of(Integer)
      expect(index[:go_cabs]).to be_an_instance_of(Integer)
    end
  end

  context "journey" do
    it 'should initialize the journey' do
      expect(new).to be_an_instance_of(Hash)
    end

    it 'should start the journey and end it at the drop location of user' do
      expect(fleet.go_cabs[new.to_h[:cab_number]].available).to be false
      expect(delete).to be_an_instance_of(Hash)
      expect(fleet.go_cabs[new.to_h[:cab_number]].available).to be true
      expect(fleet.go_cabs[new.to_h[:cab_number]].location).to eq [drop_lat, drop_long]
    end
  end
end
