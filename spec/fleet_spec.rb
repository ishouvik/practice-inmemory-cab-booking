require 'rspec'
require_relative '../app/fleet'

describe "Fleet management" do
  let(:fleet)          { Fleet.new }
  let(:go_cab_type)    { 'go' }
  let(:pink_cab_type)  { 'pink' }
  let(:rider_location) { [12.980748951664836, 77.64609817264311] }

  context "fleet" do
    it 'should create a new fleet object' do
      expect(fleet).to be_truthy
    end

    it 'should respond to proper methods' do
      expect(fleet).to respond_to(:size)
      expect(fleet).to respond_to(:go_cabs)
      expect(fleet).to respond_to(:pink_cabs)
    end

    it 'should respond to proper data types' do
      expect(fleet.size).to be_an_instance_of(Integer)
      expect(fleet.size).to be > 0
      expect(fleet.go_cabs).to be_an_instance_of(Array)
      expect(fleet.pink_cabs).to be_an_instance_of(Array)

      fleet.go_cabs.each do |cab|
        expect(cab).to be_an_instance_of(Cab)
      end

      fleet.pink_cabs.each do |cab|
        expect(cab).to be_an_instance_of(Cab)
      end
    end

    it 'should return all available go cabs array' do
      expect(fleet.available_go_cabs).to be_an_instance_of(Array)
    end

    it 'should return all busy go cabs array' do
      expect(fleet.busy_go_cabs).to be_an_instance_of(Array)
    end

    it 'should return all available pink cabs array' do
      expect(fleet.available_pink_cabs).to be_an_instance_of(Array)
    end

    it 'should return all busy pink cabs array' do
      expect(fleet.busy_pink_cabs).to be_an_instance_of(Array)
    end

    it 'should assign a go cab from the available cabs' do
      expect(fleet.assign_cab(go_cab_type, rider_location)).to be_an_instance_of(Hash)
    end

    it 'should assign a go cab from the available cabs' do
      expect(fleet.assign_cab(go_cab_type, rider_location)).to be_an_instance_of(Hash)
    end

    it 'should assign a pink cab from the available cabs' do
      expect(fleet.assign_cab(pink_cab_type, rider_location)).to be_an_instance_of(Hash)
    end
  end
end
