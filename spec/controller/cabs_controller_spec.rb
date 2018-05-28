require 'rspec'
require_relative "../../model/fleet"
require_relative '../../controller/cabs_controller'

describe 'Cabs Controller' do
  let(:fleet)       { Fleet.new }

  subject { CabsController.new }
  let(:index) { subject.index(fleet.available_pink_cabs.size, fleet.available_go_cabs.size) }

  context 'Cabs controller' do
    it 'should create a new cabs controller object ' do
      expect(subject).to be_truthy
    end
  end

  context 'index' do
    it 'should return a json hash' do
      expect(index).to be_an_instance_of(Hash)
    end

    it 'should return proper attributes' do
      expect(index[:pink_cabs]).to be_an_instance_of(Integer)
      expect(index[:go_cabs]).to be_an_instance_of(Integer)
    end
  end
end
