require 'bike_container'

shared_examples_for BikeContainer do

  let(:collection) { described_class.new }
  let(:bike_1) { double :bike_1 }

  describe "initialize" do
    it "instantiates with a default capacity" do
      expect(collection.instance_variable_get("@capacity")).to eq 20
    end

    it "instantiates with a specific capacity" do
      collection_2 = described_class.new(11)
      expect(collection_2.instance_variable_get("@capacity")).to eq 11
    end
  end

  describe "add_bike" do
    it "adds the bike into the set of bikes" do
      collection.add_bike(bike_1)
      expect(collection.instance_variable_get("@bikes")).to include bike_1
    end
  end
end
