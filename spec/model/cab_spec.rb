require 'rspec'
require_relative '../../model/cab'

describe "Cab management" do
  let(:cab) { Cab.new }

  context "Cab" do
    it 'should create a new cab object' do
      expect(Cab).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(cab).to respond_to(:available)
      expect(cab).to respond_to(:number)
    end

    it 'should respond to proper data types' do
      expect(cab.number).to be_an_instance_of(Integer)
      expect(cab.number).to be >= 0
    end
  end
end
