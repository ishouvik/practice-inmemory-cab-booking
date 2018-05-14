require 'rspec'
require_relative '../app/cab'

describe "Cab management" do
  let(:cab) { Cab.new }

  context "Cab" do
    it 'should create a new cab object' do
      expect(Cab).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(cab).to respond_to(:available)
    end
  end
end
