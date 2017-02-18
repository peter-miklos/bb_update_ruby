require 'garage'

describe Garage do
  it_behaves_like BikeContainer

  let(:garage) { described_class.new }
  let(:bike_1) { double :bike_1 }
  let(:bike_2) { double :bike_2 }

  before(:each) do
    allow(bike_1).to receive(:working?).and_return(true)
    allow(bike_2).to receive(:working?).and_return(false)
    allow(bike_2).to receive(:repair_bike).and_return(true)
  end

  describe "repair_bike" do
    it "calls the repair_bike method on the bike" do
      garage.add_bike(bike_2)
      expect(bike_2).to receive(:repair_bike)
      garage.repair_bike(bike_2)
    end
  end
end
