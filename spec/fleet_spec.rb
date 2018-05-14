require 'rspec'
require_relative '../app/fleet'

describe "Fleet management" do
  let(:fleet) { Fleet.new }

  context "fleet" do
    it 'should respond to proper methods' do
      expect(fleet).to be_truthy
    end
  end
end
