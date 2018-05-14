require 'rspec'
require_relative '../helper/payment'

describe "Payment helper" do
  let(:payment) { Payment.new }

  context "payment" do
    it 'should create a new payment object' do
      expect(payment).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(Payment).to respond_to(:amount)
    end
  end
end
