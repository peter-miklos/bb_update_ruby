require 'van'

describe Van do

  let(:van) { described_class.new }
  let (:bike_1) { double :bike_1 }

  describe "load_bike" do

    it "loads the bike into the van" do
      van.load_bike(bike_1)
      bikes = van.instance_variable_get("@bikes")
      expect(bikes.size).to eq 1
      expect(bikes[0]).to eq bike_1
    end

  end

  describe "unload_bike" do

    it "unloads the bike from the van" do
      van.load_bike(bike_1)
      expect(van.unload_bike(bike_1)).to eq bike_1
      bikes = van.instance_variable_get("@bikes")
      expect(bikes.size).to eq 0
    end

  end
end
