require 'van'

describe Van do

  let(:van) { described_class.new }
  let (:bike_1) { double :bike_1 }
  let (:bike_2) { double :bike_2 }

  describe "initialize" do
    it "instantiates the van with a specific capacity" do
      van_2 = described_class.new(3)
      expect(van_2.instance_variable_get("@capacity")).to be 3
    end
  end

  describe "load_bike" do

    it "loads the bike into the van" do
      van.load_bike(bike_1)
      bikes = van.instance_variable_get("@bikes")
      expect(bikes.size).to eq 1
      expect(bikes[0]).to eq bike_1
    end

    it "raises error if the van is full" do
      van_2 = described_class.new(1)
      van_2.load_bike(bike_1)
      expect{van_2.load_bike(bike_2)}.to raise_error("Bike cannot be loaded, van is full")
    end

  end

  describe "unload_bike" do

    it "unloads the bike from the van" do
      van.load_bike(bike_1)
      expect(van.unload_bike(bike_1)).to eq bike_1
      bikes = van.instance_variable_get("@bikes")
      expect(bikes.size).to eq 0
    end

    it "raise error if the bike is not in the van" do
      van.load_bike(bike_1)
      expect{van.unload_bike(bike_2)}.to raise_error("The bike is not in the van")
    end

  end
end
