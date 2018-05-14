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
  end
end
