require 'rspec'
require_relative '../../model/User'
require_relative '../../model/cab'

describe "Cab management" do
  let(:user) { User.new(12.979644698160321, 77.64538439713968, 12.970551164386844, 77.63746822801073) }
  let(:cab) { Cab.new(1, user) }

  context "Cab" do
    it 'should create a new cab object' do
      expect(Cab).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(cab).to respond_to(:available)
      expect(cab).to respond_to(:number)
      expect(cab).to respond_to (:location)
      expect(cab).to respond_to(:user)
    end

    it 'should respond to proper data types' do
      expect(cab.number).to be_an_instance_of(Integer)
      expect(cab.number).to be >= 0
      expect(cab.location).to be_an_instance_of(Array)
    end
  end
end
