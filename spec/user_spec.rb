require 'rspec'
require_relative '../app/user'

describe "User management" do
  let(:user) { User.new }

  context "User" do
    it 'should create a new cab object' do
      expect(user).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(user).to respond_to(:pickup_location)
      expect(user).to respond_to(:drop_location)
    end

    it 'should respond to proper data types' do
      expect(user.pickup_location).to be_an_instance_of(Array)
      expect(user.drop_location).to   be_an_instance_of(Array)
    end
  end
end
