require 'rspec'
require_relative '../app/user'

describe "User management" do
  let(:user) { User.new }

  context "User" do
    it 'should create a new cab object' do
      expect(user).to be_truthy
    end
  end
end
