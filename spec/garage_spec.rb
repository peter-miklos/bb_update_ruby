require 'garage'

describe Garage do

  let(:garage) { described_class.new }
  let(:bike_1) { double :bike_1 }
  let(:bike_2) { double :bike_2 }

  before(:each) do
    allow(bike_1).to receive(:working?).and_return(true)
    allow(bike_2).to receive(:working?).and_return(false)
    allow(bike_2).to receive(:repair_bike).and_return(true)
  end

  describe "initialize" do
    it "instantiates the garage with a specific capacity" do
      other_garage = described_class.new(11)
      expect(other_garage.instance_variable_get("@capacity")).to eq 11
    end
  end

  describe "add_bike" do
    it "adds the bike to the garage" do
      garage.add_bike(bike_1)
      expect(garage.instance_variable_get("@bikes")).to include bike_1
    end

    it "raises error if the garage is full" do
      other_garage = described_class.new(1)
      other_garage.add_bike(bike_1)
      expect{other_garage.add_bike(bike_2)}.to raise_error("Bike cannot be added, garage is full")
    end
  end

  describe "repair_bike" do
    it "calls the repair_bike method on the bike" do
      garage.add_bike(bike_2)
      expect(bike_2).to receive(:repair_bike)
      garage.repair_bike(bike_2)
    end
  end

  describe "remove_bike" do
    it "removes the bike from the garage" do
      garage.add_bike(bike_2)
      garage.repair_bike(bike_2)
      garage.remove_bike(bike_2)
      expect(garage.instance_variable_get("@bikes")).not_to include bike_2
    end

    it "raises error if the bike is not available in the garage" do
      garage.add_bike(bike_2)
      expect{garage.remove_bike(bike_1)}.to raise_error("Bike is not in the garage")
    end
  end
end
