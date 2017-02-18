require 'bike_container'

shared_examples_for BikeContainer do

  let(:collection) { described_class.new }
  let(:bike_1) { double :bike_1 }
  let(:bike_2) { double :bike_2 }

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

    it "raises error if the container is full" do
      collection_2 = described_class.new(1)
      collection_2.add_bike(bike_1)
      expect{collection_2.add_bike(bike_2)}.to raise_error("#{described_class.name} is full")
    end
  end

  describe "remove_bike" do
    it "removes the last available bike" do
      collection.add_bike(bike_2)
      collection.add_bike(bike_1)
      collection.remove_bike
      expect(collection.instance_variable_get("@bikes")).to include bike_2
      expect(collection.instance_variable_get("@bikes")).not_to include bike_1
    end

    it "raises error if the container is empty" do
      expect{collection.remove_bike}.to raise_error("#{described_class.name} is empty")
    end
  end

  describe "full?" do
    it "returns true if the bike container is full" do
      collection_2 = described_class.new(1)
      collection_2.add_bike(bike_1)
      expect(collection_2.full?).to be_truthy
    end

    it "returns false if more bikes can be added" do
      expect(collection.full?).to be_falsy
    end
  end

  describe "empty?" do
    it "returns true if the container is empty" do
      expect(collection.empty?).to be_truthy
    end

    it "returns false if the container is not empty" do
      collection.add_bike(bike_1)
      expect(collection.empty?).to be_falsy
    end
  end
end
